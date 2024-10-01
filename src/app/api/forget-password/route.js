import { NextResponse } from 'next/server';
import nodemailer from 'nodemailer';
import jwt from 'jsonwebtoken';
import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

export async function POST(req) {
  const transporter = nodemailer.createTransport({
    service: 'Gmail',
    auth: {
      user: process.env.EMAIL_USER,
      pass: process.env.EMAIL_PASS,
    },
  });

  try {
    const body = await req.json();
    const { email } = body;
    const user = await prisma.user.findFirst({ where: { email, isDeleted: "N" } });
    if (!user) {
      return NextResponse.json({ result: false, message: 'User not found' });
    }
    const token = jwt.sign({ email }, process.env.JWT_SECRET, { expiresIn: '1h' });
    const resetLink = `${process.env.NEXT_PUBLIC_APP_URL}/en/pages/auth/reset-password-v1?token=${token}`;
    await transporter.sendMail({
      to: email,
      subject: 'Password Reset Request',
      html: `<p>Click <a href="${resetLink}">here</a> to reset your password.</p>`,
    });
    return NextResponse.json({ result: true, message: 'Reset email sent successfully', resetLink });
  } catch (error) {
    return NextResponse.json(error);
  }
}
