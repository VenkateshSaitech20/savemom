import { NextResponse } from 'next/server';
import { PrismaClient } from '@prisma/client';
import { registerData, responseData, validations } from '@/utils/message';
// import { extractTokenData } from '@/utils/helper';
// import { deleteFields } from '../api-utlis/helper';

const prisma = new PrismaClient();

// Get All subscribers
// export async function GET() {
//     try {
//         const subscribers = await prisma.subscribers.findMany({});
//         deleteFields(subscribers, ['createdAt', 'updatedAt', 'updatedUser']);
//         return NextResponse.json({ result: true, message: subscribers });
//     } catch (error) {
//         return NextResponse.json({ result: false, error: error.message });
//     }
// };

// Add Subscribers
export async function POST(req) {
    try {
        const body = await req.json();
        const { email } = body;
        if (!email || !validations.emailPattern.test(email)) {
            return NextResponse.json({ result: false, message: { email: registerData.emailValMsg } });
        }
        const existingEmail = await prisma.subscribers.findFirst({ where: { email } });

        if (existingEmail) {
            return NextResponse.json({ result: false, message: { email: responseData.existSubscribed } });
        }
        await prisma.subscribers.create({ data: { email } });
        return NextResponse.json({ result: true, message: responseData.emailSubscribed });
    } catch (error) {
        return NextResponse.json({ result: false, message: error });
    }
};
