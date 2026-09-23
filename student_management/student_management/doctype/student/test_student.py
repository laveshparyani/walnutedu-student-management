# Copyright (c) 2025, Lavesh Paryani and Contributors
# See license.txt

import frappe
from frappe.tests.utils import FrappeTestCase


def make_student(**overrides):
	values = {
		"doctype": "Student",
		"first_name": "Test",
		"last_name": "Student",
		"email": f"test.student.{frappe.generate_hash(length=6)}@example.com",
		"phone": "+91 9876543210",
		"gender": "Female",
		"grade": "Grade 4",
	}
	values.update(overrides)
	return frappe.get_doc(values)


class TestStudent(FrappeTestCase):
	def tearDown(self):
		frappe.db.delete("Student", {"first_name": "Test"})

	def test_full_name_is_derived(self):
		student = make_student().insert()
		self.assertEqual(student.full_name, "Test Student")
		self.assertTrue(student.name.startswith("WNUT-"))

	def test_invalid_email_is_rejected(self):
		student = make_student(email="not-an-email")
		self.assertRaises(frappe.ValidationError, student.insert)

	def test_duplicate_email_is_rejected(self):
		first = make_student().insert()
		duplicate = make_student(email=first.email)
		self.assertRaises(frappe.UniqueValidationError, duplicate.insert)

	def test_enrollment_before_birth_is_rejected(self):
		student = make_student(date_of_birth="2015-06-01", enrollment_date="2014-01-01")
		self.assertRaises(frappe.ValidationError, student.insert)
