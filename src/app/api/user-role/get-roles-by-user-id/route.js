import { NextResponse } from 'next/server';
import { PrismaClient } from '@prisma/client';
import { extractTokenData } from '@/utils/helper';
import { responseData } from '@/utils/message';
const prisma = new PrismaClient();

export async function POST(req) {
    try {
        const token = extractTokenData(req.headers);
        const body = await req.json();
        let { searchText, page, pageSize } = body;
        if (!token.id) {
            return NextResponse.json({ result: false, message: { invalidToken: responseData.invalidToken } });
        };
        let userId = token.id;
        const user = await prisma.user.findUnique({ where: { id: userId } });
        if (!user) {
            return NextResponse.json({ result: false, message: { userNotFound: responseData.userNotFound } });
        }
        if (user.roleId !== "1") {
            userId = user.createdBy
        }
        const queryFilter = {
            AND: [
                { userId },
                { isDeleted: 'N' }
            ]
        };
        if (searchText) {
            queryFilter.AND.push({
                roleName: {
                    contains: searchText,
                }
            });
        }
        if (page && pageSize) {
            let skip = (page - 1) * pageSize;

            const totalCount = await prisma.role.count({
                where: queryFilter
            });
            // Ensure skip doesn't exceed totalCount
            if (skip >= totalCount) {
                skip = totalCount - pageSize;
            }
            if (skip < 0) skip = 0;  // Ensure skip is not negative
            const getRoles = await prisma.role.findMany({
                where: queryFilter,
                select: {
                    id: true,
                    userId: true,
                    roleName: true,
                },
                skip,
                take: pageSize
            });
            const totalPages = Math.ceil(totalCount / pageSize);
            return NextResponse.json({
                result: true,
                message: getRoles,
                totalPages
            });
        } else {
            const getRoles = await prisma.role.findMany({
                where: queryFilter,
                select: {
                    id: true,
                    userId: true,
                    roleName: true,
                }
            });
            return NextResponse.json({
                result: true,
                message: getRoles
            });
        }
    } catch (error) {
        return NextResponse.json({ result: false, message: error.message });
    }
}
