import { NextResponse } from 'next/server';
import { PrismaClient } from '@prisma/client';
import { deleteFields } from '../../api-utlis/helper';
import { responseData } from '@/utils/message';
import { extractTokenData } from '@/utils/helper';
const prisma = new PrismaClient();

export async function POST(req) {
    try {
        const token = extractTokenData(req.headers);
        if (!token.id) {
            return NextResponse.json({ result: false, message: { tokenExpired: responseData.tokenExpired } });
        }
        const user = await prisma.user.findUnique({ where: { id: token.id, isDeleted: "N" } });
        if (!user.id) {
            return NextResponse.json({ result: false, message: { userNotFound: responseData.userNotFound } });
        }
        const body = await req.json();
        const { id } = body;
        if (!id) {
            return NextResponse.json({ result: false, message: responseData.notFound });
        }
        const paymentGatewayDetail = await prisma.configure_subscription.findUnique({ where: { id: id } });
        if (paymentGatewayDetail) {
            deleteFields(paymentGatewayDetail, ['createdAt', 'updatedAt', 'updatedUser', 'createdUser']);
            return NextResponse.json({ result: true, message: paymentGatewayDetail });
        }
        return NextResponse.json({ result: true, message: {} });
    } catch (error) {
        return NextResponse.json({ result: false, message: error });
    }
};
