import { NextResponse } from 'next/server';
import { PrismaClient } from '@prisma/client';
import { extractTokenData } from '@/utils/helper';
import { responseData } from '@/utils/message';
import { utils, write } from 'xlsx'; // Use write instead of writeFile

const prisma = new PrismaClient();

export async function POST(req) {
    try {
        const token = extractTokenData(req.headers);
        if (!token.id) {
            return NextResponse.json({ result: false, message: { invalidToken: responseData.invalidToken } });
        }
        let userId = token.id;
        const user = await prisma.user.findUnique({ where: { id: userId, isDeleted: "N" } });
        if (!user) {
            return NextResponse.json({ result: false, message: { userNotFound: responseData.userNotFound } });
        }
        if (user.roleId !== "1") {
            userId = user.subUserId;
        }
        const queryFilter = {
            AND: [
                { subUserId: userId },
                { isDeleted: 'N' },
                { id: { not: user.id } },
                { roleId: { not: "1" } }
            ]
        };
        const users = await prisma.user.findMany({
            where: queryFilter,
            select: {
                id: true,
                subUserId: true,
                name: true,
                email: true,
                contactNo: true,
                roleName: true,
                country: true,
                state: true,
                address: true,
                profileStatus: true,
                companyName: true
            }
        });
        const worksheetData = [
            ['Name', 'Email', 'Phone Number', 'Role Name', 'Address', 'State', 'Country', 'Company Name', 'Profile Status'],
            ...users.map(user => [
                user.name,
                user.email,
                user.contactNo,
                user.roleName,
                user.address,
                user.state,
                user.country,
                user.companyName,
                user.profileStatus,
            ])
        ];
        const worksheet = utils.aoa_to_sheet(worksheetData);
        const workbook = utils.book_new();
        utils.book_append_sheet(workbook, worksheet, 'Users');
        const excelBuffer = write(workbook, { type: 'buffer', bookType: 'xlsx' });
        return new NextResponse(excelBuffer, {
            headers: {
                'Content-Type': 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
                'Content-Disposition': 'attachment; filename="users.xlsx"',
                'Content-Length': excelBuffer.length
            }
        });
    } catch (error) {
        return NextResponse.json({ result: false, message: { roleError: error.message } });
    }
}
