import { utils, write } from 'xlsx';
export async function POST(req) {
    try {
        const { fileType } = await req.json();
        if (fileType === "users") {
            const worksheetData = [
                ['name', 'email', 'password', 'contactNo', 'country', 'companyName']
            ];
            const worksheet = utils.aoa_to_sheet(worksheetData);
            const workbook = utils.book_new();
            utils.book_append_sheet(workbook, worksheet, 'Users');
            const excelBuffer = write(workbook, { type: 'buffer', bookType: 'xlsx' });
            return new Response(excelBuffer, {
                headers: {
                    'Content-Type': 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
                    'Content-Disposition': 'attachment; filename="users.xlsx"'
                }
            });
        } else if (fileType === "countries") {
            const worksheetData = [
                ['name']
            ];
            const worksheet = utils.aoa_to_sheet(worksheetData);
            const workbook = utils.book_new();
            utils.book_append_sheet(workbook, worksheet, 'Countries');
            const excelBuffer = write(workbook, { type: 'buffer', bookType: 'xlsx' });
            return new Response(excelBuffer, {
                headers: {
                    'Content-Type': 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
                    'Content-Disposition': 'attachment; filename="countries.xlsx"'
                }
            });
        } else if (fileType === "states") {
            const worksheetData = [
                ['name', 'countryId', 'country']
            ];
            const worksheet = utils.aoa_to_sheet(worksheetData);
            const workbook = utils.book_new();
            utils.book_append_sheet(workbook, worksheet, 'States');
            const excelBuffer = write(workbook, { type: 'buffer', bookType: 'xlsx' });
            return new Response(excelBuffer, {
                headers: {
                    'Content-Type': 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
                    'Content-Disposition': 'attachment; filename="states.xlsx"'
                }
            });
        } else if (fileType === "cities") {
            const worksheetData = [
                ['name', 'countryId', 'country', 'stateId', 'state']
            ];
            const worksheet = utils.aoa_to_sheet(worksheetData);
            const workbook = utils.book_new();
            utils.book_append_sheet(workbook, worksheet, 'Cities');
            const excelBuffer = write(workbook, { type: 'buffer', bookType: 'xlsx' });
            return new Response(excelBuffer, {
                headers: {
                    'Content-Type': 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
                    'Content-Disposition': 'attachment; filename="cities.xlsx"'
                }
            });
        } else {
            const worksheetData = [
                ['name', 'countryId', 'country', 'stateId', 'state', 'cityId', 'city']
            ];
            const worksheet = utils.aoa_to_sheet(worksheetData);
            const workbook = utils.book_new();
            utils.book_append_sheet(workbook, worksheet, 'Districts');
            const excelBuffer = write(workbook, { type: 'buffer', bookType: 'xlsx' });
            return new Response(excelBuffer, {
                headers: {
                    'Content-Type': 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
                    'Content-Disposition': 'attachment; filename="districts.xlsx"'
                }
            });
        }
    } catch (error) {
        return new Response(JSON.stringify({ result: false, message: { roleError: error.message } }), {
            headers: { 'Content-Type': 'application/json' }
        });
    }
}
