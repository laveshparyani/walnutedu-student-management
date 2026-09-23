# Copyright (c) 2025, Lavesh Paryani and contributors
# For license information, please see license.txt

import frappe
from frappe import _
from frappe.model.document import Document
from frappe.utils import getdate, today


class Student(Document):
	def validate(self):
		self.set_full_name()
		self.validate_dates()

	def set_full_name(self):
		"""Full Name is derived, never typed: it must always match First + Last Name."""
		parts = [(self.first_name or "").strip(), (self.last_name or "").strip()]
		self.full_name = " ".join(p for p in parts if p)

	def validate_dates(self):
		if self.date_of_birth and getdate(self.date_of_birth) > getdate(today()):
			frappe.throw(_("Date of Birth cannot be in the future."))

		if (
			self.date_of_birth
			and self.enrollment_date
			and getdate(self.enrollment_date) < getdate(self.date_of_birth)
		):
			frappe.throw(_("Enrollment Date cannot be before the Date of Birth."))
