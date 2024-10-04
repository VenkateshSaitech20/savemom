import { NextResponse } from 'next/server';
import { PrismaClient } from '@prisma/client';
import { registerData, responseData } from '@/utils/message';
import { capitalizeFirstLetter, extractTokenData } from '@/utils/helper';
import { validateFields } from '../../api-utlis/helper';
const prisma = new PrismaClient();
export async function GET() {
    try {
        const ourTeam = await prisma.country.findMany({ where: { isDeleted: "N" } });
        deleteFields(ourTeam, ['createdAt', 'updatedAt', 'updatedUser']);
        return NextResponse.json({ result: true, message: ourTeam });
    } catch (error) {
        return NextResponse.json({ result: false, error: error.message });
    }
};
export async function POST(req) {
    try {
        let userId;
        const token = extractTokenData(req.headers);
        if (!token) {
            return NextResponse.json({ result: false, message: { tokenExpired: responseData.tokenExpired } });
        }
        const user = await prisma.user.findUnique({ where: { id: token.id, isDeleted: "N" } });
        if (!user) {
            return NextResponse.json({ result: false, message: { userNotFound: responseData.userNotFound } });
        }
        if (user?.id) { userId = user.id }
        const body = await req.json();
        const { phoneCode, isActive, id } = body;
        let sortname = body?.sortname?.toUpperCase();
        let name = capitalizeFirstLetter(body?.name);
        const emptyFieldErrors = {};
        if (!name || name?.trim() === "") {
            emptyFieldErrors.name = registerData.countryNameReq;
        }
        if (!sortname || sortname?.trim() === "") {
            emptyFieldErrors.sortname = registerData.sortnameReq;
        }
        if (!phoneCode || phoneCode?.trim() === "") {
            emptyFieldErrors.phoneCode = registerData.phnCodeReq;
        }
        if (Object.keys(emptyFieldErrors).length > 0) {
            return NextResponse.json({ result: false, message: emptyFieldErrors });
        };
        const validatingFields = {
            name: { type: "name", message: registerData.countryFieldVal },
            sortname: { type: "sortname", message: registerData.sortnameFieldVal },
            phoneCode: { type: "number", message: registerData.phoneCodeFieldVal },
        };
        const fields = { name, sortname, phoneCode };
        let fieldErrors = validateFields(fields, validatingFields);
        if (Object.keys(fieldErrors).length > 0) {
            return NextResponse.json({ result: false, message: fieldErrors });
        };
        const data = { name, sortname, phoneCode, isActive };
        if (id) {
            data.updatedUser = userId;
            const existingRec = await prisma.country.findUnique({ where: { id: id } });
            if (!existingRec) {
                return NextResponse.json({ result: false, message: { notFound: responseData.noData } })
            }
            const updatedCountry = await prisma.country.update({ where: { id: existingRec.id }, data });
            return NextResponse.json({ result: true, message: updatedCountry });
        } else {
            const errors = {};
            const existCountry = await prisma.country.findFirst({ where: { name: name, isDeleted: "N" } });
            if (existCountry) {
                errors.name = responseData.countryExists;
            }
            const existSortName = await prisma.country.findFirst({ where: { sortname: sortname, isDeleted: "N" } });
            if (existSortName) {
                errors.sortname = responseData.sortnameExists;
            }
            const existPhoneCode = await prisma.country.findFirst({ where: { phoneCode: phoneCode, isDeleted: "N" } });
            if (existPhoneCode) {
                errors.phoneCode = responseData.phnCodeExists;
            }
            if (Object.keys(errors).length > 0) {
                return NextResponse.json({ result: false, message: errors });
            }
            await prisma.country.create({ data: { ...data, createdUser: userId } });
            return NextResponse.json({ result: true, message: responseData.dataCreateded });
        }
    } catch (error) {
        return NextResponse.json({ result: false, message: error });
    }
};

export async function PUT(req) {
    try {
        const token = extractTokenData(req.headers);
        if (!token.id) {
            return NextResponse.json({ result: false, message: { tokenExpired: responseData.tokenExpired } });
        }
        const user = await prisma.user.findUnique({ where: { id: token.id, isDeleted: "N" } });
        if (!user) {
            return NextResponse.json({ result: false, message: { userNotFound: responseData.userNotFound } });
        }
        const body = await req.json();
        const { id } = body;
        await prisma.country.update({
            where: { id: id },
            data: { isDeleted: 'Y' }
        });
        return NextResponse.json({ result: true, message: responseData.delSuccess })
    } catch (error) {
        return NextResponse.json({ result: false, message: error });
    }
}
