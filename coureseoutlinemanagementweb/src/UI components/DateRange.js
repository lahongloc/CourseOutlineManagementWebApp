import * as React from "react";
import { useLocation, useSearchParams } from "react-router-dom";
import { DemoContainer } from "@mui/x-date-pickers/internals/demo";
import { LocalizationProvider } from "@mui/x-date-pickers/LocalizationProvider";
import { AdapterDayjs } from "@mui/x-date-pickers-pro/AdapterDayjs";
import { DateRangePicker } from "@mui/x-date-pickers-pro/DateRangePicker";
import { LicenseInfo } from "@mui/x-date-pickers-pro";

LicenseInfo.setLicenseKey(
	"e0d9bb8070ce0054c9d9ecb6e82cb58fTz0wLEU9MzI0NzIxNDQwMDAwMDAsUz1wcmVtaXVtLExNPXBlcnBldHVhbCxLVj0y",
);

export default function DateRange({ value, handleDateChange }) {
	return (
		<LocalizationProvider dateAdapter={AdapterDayjs}>
			<DemoContainer components={["DateRangePicker"]}>
				<DateRangePicker
					localeText={{
						start: "Thời gian áp dụng",
						end: "Thời gian hết hiệu lực",
					}}
					value={value}
					onChange={handleDateChange}
				/>
			</DemoContainer>
		</LocalizationProvider>
	);
}
