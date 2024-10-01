import { NextResponse } from 'next/server';
import { PrismaClient } from '@prisma/client';
import { registerData, responseData } from '@/utils/message';
import path from 'path';
import { extractTokenData } from '@/utils/helper';
import { deleteFields, deleteFile, getFilePathFromUrl, validateFields, writeFile } from '../api-utlis/helper';
const prisma = new PrismaClient();

// Get Profile details
export async function GET(req) {
    try {
        const token = extractTokenData(req.headers);
        if (!token) {
            return NextResponse.json({ result: false, message: { tokenExpired: responseData.tokenExpired } });
        }
        const user = await prisma.user.findUnique({ where: { id: token.id, isDeleted: "N" } });
        let userId = user.id;
        deleteFields(user, ['createdAt', 'updatedAt', 'password', 'language', 'roleId', 'isDeleted', 'createdBy', 'subscriptionPlan',])
        if (!userId) {
            return NextResponse.json({ result: false, message: { userNotFound: responseData.userNotFound } });
        } else {
            return NextResponse.json({
                result: true,
                message: user
            });
        }
    } catch (error) {
        return NextResponse.json({ error: error.message });
    }
};

// Profile update
export async function PUT(req) {
    try {
        const token = extractTokenData(req.headers);
        if (!token) {
            return NextResponse.json({ result: false, message: { tokenExpired: responseData.tokenExpired } });
        }
        const user = await prisma.user.findUnique({ where: { id: token.id, isDeleted: "N" } });
        let userId = user.id;
        const oldImageUrl = user.image;

        if (!userId) {
            return NextResponse.json({ result: false, message: { userNotFound: responseData.userNotFound } });
        }
        const formData = await req.formData();
        const fields = {};
        const file = formData.get('image');
        let profileImageUrl = '';

        for (const [key, value] of formData.entries()) {
            fields[key] = value;
        }
        const { name, email, contactNo, address, state, zipCode, country, companyName } = fields;
        const emptyFieldErrors = {};

        if (name.trim() === "") {
            emptyFieldErrors.name = registerData.nameReq;
        }
        if (email.trim() === "") {
            emptyFieldErrors.email = registerData.emailReq;
        }
        if (Object.keys(emptyFieldErrors).length > 0) {
            return NextResponse.json({ result: false, message: emptyFieldErrors });
        }
        const validatingFields = {
            name: { type: "name", message: registerData.nameFieldVal },
            email: { type: "email", message: registerData.emailValMsg },
            contactNo: { type: "mobileNumber", message: registerData.phoneValMsg },
            address: { type: "address", message: registerData.addressValMsg },
            state: { type: "name", message: registerData.nameFieldVal },
            zipCode: { type: "number", message: registerData.zipFieldVal },
            country: { type: "name", message: registerData.countryFieldVal },
            companyName: { type: "name", message: registerData.companyFieldVal },
        }
        let fieldErrors = validateFields(fields, validatingFields);
        if (Object.keys(fieldErrors).length > 0) {
            return NextResponse.json({ result: false, message: fieldErrors });
        }
        const errors = {};
        const existsEmail = await prisma.user.findFirst({
            where: {
                AND: [
                    { email: email },
                    { id: { not: userId } },
                    { isDeleted: 'N' }
                ]
            }
        });
        const contactNoExists = await prisma.user.findFirst({
            where: { contactNo: contactNo, isDeleted: 'N', id: { not: userId } }
        });
        if (existsEmail && existsEmail != "") {
            errors.email = responseData.emailExists;
        }
        if (contactNoExists && contactNoExists.contactNo != "") {
            errors.contactNo = responseData.contactNoExists;
        }
        if (Object.keys(errors).length > 0) {
            return NextResponse.json({ result: false, message: errors });
        }
        if (file) {
            const buffer = Buffer.from(await file.arrayBuffer());
            const filename = Date.now() + '_' + file.name.replace(/\s+/g, '_');
            const localFilePath = path.join(process.cwd(), process.env.MAIN_FOLDER_PATH, process.env.PROFILE_IMAGE_FOLDER_PATH, filename);
            await writeFile(localFilePath, buffer);
            profileImageUrl = `${process.env.NEXT_PUBLIC_APP_URL}/${process.env.PROFILE_IMAGE_FOLDER_PATH}/${filename}`;
        }
        await prisma.user.update({
            where: { id: userId },
            data: {
                name,
                email,
                contactNo,
                address,
                state,
                zipCode,
                country,
                companyName,
                image: profileImageUrl || oldImageUrl
            }
        });
        const baseDir = `${process.env.MAIN_FOLDER_PATH}`;
        if (file && oldImageUrl) {
            const oldImageFilePath = getFilePathFromUrl(oldImageUrl, baseDir);
            try {
                await deleteFile(oldImageFilePath);
            } catch (error) {
                console.error('Failed to delete old image:', error);
            }
        }

        return NextResponse.json({ result: true, message: responseData.profileUpdated });
    } catch (error) {
        return NextResponse.json({ result: false, message: error });
    }
}
