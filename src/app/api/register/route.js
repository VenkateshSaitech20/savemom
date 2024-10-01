import { NextResponse } from 'next/server';
import { PrismaClient } from '@prisma/client';
import { registerData, responseData } from '@/utils/message';
import { validateFields } from '../api-utlis/helper';

const bcrypt = require('bcrypt');
const prisma = new PrismaClient();

// User registration
export async function POST(req) {
	const saltRounds = 10;
	async function hashPassword(password) {
		return bcrypt.hash(password, saltRounds);
	}
	try {
		const body = await req.json();
		const { name, email, password } = body;
		const fields = { name, email, password };
		const emptyFieldErrors = {};
		if (name.trim() === "") {
			emptyFieldErrors.name = registerData.nameReq;
		}
		if (email.trim() === "") {
			emptyFieldErrors.email = registerData.emailReq;
		}
		if (password.trim() === "") {
			emptyFieldErrors.password = registerData.passwordReq;
		}
		if (Object.keys(emptyFieldErrors).length > 0) {
			return NextResponse.json({ result: false, message: emptyFieldErrors });
		};
		const validatingFields = {
			name: { type: "name", message: registerData.nameFieldVal },
			email: { type: "email", message: registerData.emailValMsg },
		};
		let fieldErrors = validateFields(fields, validatingFields);
		if (Object.keys(fieldErrors).length > 0) {
			return NextResponse.json({ result: false, message: fieldErrors });
		};
		const hashedPassword = await hashPassword(password);
		const existUser = await prisma.user.findFirst({ where: { email: email, isDeleted: "N" } })
		if (existUser) {
			return NextResponse.json({ result: false, message: { email: responseData.emailExists } });
		};
		const inserted = await prisma.user.create({
			data: { name, email, password: hashedPassword, profileStatus: "Active" },
		});
		const createdBy = inserted.id;
		await prisma.user.update({ where: { id: createdBy }, data: { createdBy } });
		return NextResponse.json({ result: true, message: responseData.userCreated });
	} catch (error) {
		return NextResponse.json({ error: error.message });
	}
};