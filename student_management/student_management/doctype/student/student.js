// Copyright (c) 2025, Lavesh Paryani and contributors
// For license information, please see license.txt

frappe.ui.form.on("Student", {
	first_name(frm) {
		set_full_name(frm);
	},
	last_name(frm) {
		set_full_name(frm);
	},
});

function set_full_name(frm) {
	const parts = [frm.doc.first_name, frm.doc.last_name].map((p) => (p || "").trim());
	frm.set_value("full_name", parts.filter(Boolean).join(" "));
}
