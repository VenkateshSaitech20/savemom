import { extractTokenData } from '@/utils/helper';
import { createTransporter, mailOptions, nodemailerCredential } from '../api-utlis/nodemailer';
import { NextResponse } from 'next/server';
import { registerData, responseData } from '@/utils/message';
import { PrismaClient } from '@prisma/client';
import { validateFields } from '../api-utlis/helper';
const prisma = new PrismaClient();

// Send email
export async function POST(req) {
    const token = extractTokenData(req.headers);
    if (!token.id) {
        return NextResponse.json({ result: false, message: { tokenExpired: responseData.tokenExpired } });
    }
    const user = await prisma.user.findUnique({ where: { id: token.id, isDeleted: "N" } });
    if (!user) {
        return NextResponse.json({ result: false, message: { userNotFound: responseData.userNotFound } });
    }
    let userId = token.id;
    const body = await req.json();
    const { to, subject, message, sendMailTo } = body;
    const emptyFieldErrors = {};
    const email = await nodemailerCredential();
    const transporter = await createTransporter();

    // For all-users
    if (sendMailTo === "all-users") {
        const userEmails = await prisma.user.findMany({ where: { isDeleted: "N" }, select: { email: true } });
        const emailList = userEmails.map(userEmail => userEmail.email).join(", ");
        const sendMailPromises = userEmails.map(async (userEmail) => {
            const individualMailOptions = mailOptions(userEmail.email, subject, message);
            try {
                await transporter.sendMail(individualMailOptions);
            } catch (error) {
                console.error(`Failed to send email to ${userEmail.email}:`, error.message);
            }
        });
        await Promise.all(sendMailPromises);
        await prisma.sent_emails.create({
            data: {
                from: email,
                to: emailList,
                subject: subject,
                message: message,
                sendMailTo: sendMailTo,
                sentBy: userId
            },
        });
        return NextResponse.json({ result: true, message: responseData.emailSentSuccMsg });
    } else {
        // For single user
        if (!to || to.trim() === "") {
            emptyFieldErrors.to = registerData.emailReq;
        }
        if (Object.keys(emptyFieldErrors).length > 0) {
            return NextResponse.json({ result: false, message: emptyFieldErrors });
        }
        const validatingFields = {
            to: { type: "email", message: registerData.emailValMsg },
        };
        let fieldErrors = validateFields({ to }, validatingFields);
        if (Object.keys(fieldErrors).length > 0) {
            return NextResponse.json({ result: false, message: fieldErrors });
        }
        const customMailOptions = mailOptions(to, subject, message);
        try {
            await prisma.sent_emails.create({
                data: {
                    from: email,
                    to: to,
                    subject: subject,
                    message: message,
                    sendMailTo: sendMailTo,
                    sentBy: userId
                },
            });
            await transporter.sendMail(customMailOptions);
            return NextResponse.json({ result: true, message: responseData.emailSentSuccMsg });
        } catch (error) {
            return NextResponse.json({ result: false, error: error.message });
        }
    }
}
