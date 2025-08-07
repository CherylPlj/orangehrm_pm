<!--
/**
 * OrangeHRM is a comprehensive Human Resource Management (HRM) System that captures
 * all the essential functionalities required for any enterprise.
 * Copyright (C) 2006 OrangeHRM Inc., http://www.orangehrm.com
 *
 * OrangeHRM is free software: you can redistribute it and/or modify it under the terms of
 * the GNU General Public License as published by the Free Software Foundation, either
 * version 3 of the License, or (at your option) any later version.
 *
 * OrangeHRM is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
 * without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with OrangeHRM.
 * If not, see <https://www.gnu.org/licenses/>.
 */
 -->

<template>
  <edit-employee-layout :employee-id="empNumber" screen="personal">
    <div class="orangehrm-horizontal-padding orangehrm-vertical-padding">
      <oxd-text tag="h6" class="orangehrm-main-title">
        {{ $t('general.personal_details') }}
      </oxd-text>
      <oxd-divider />
      
      <!-- Enhanced Personal Details Form -->
      <oxd-form :loading="isLoading" @submit-valid="onSave">
        
        <!-- Basic Information Section -->
        <oxd-text class="orangehrm-sub-title" tag="h6">
          {{ $t('pim.basic_information') }}
        </oxd-text>
        <oxd-divider />
        
        <oxd-form-row>
          <oxd-grid :cols="1" class="orangehrm-full-width-grid">
            <oxd-grid-item>
              <full-name-input
                v-model:firstName="employee.firstName"
                v-model:middleName="employee.middleName"
                v-model:lastName="employee.lastName"
                :rules="rules"
              />
            </oxd-grid-item>
          </oxd-grid>
          
          <!-- University-specific fields -->
          <oxd-grid :cols="3" class="orangehrm-full-width-grid">
            <oxd-grid-item>
              <oxd-input-field
                v-model="employee.employeeId"
                :label="$t('general.employee_id')"
                :rules="rules.employeeId"
                :disabled="!$can.update(`personal_sensitive_information`)"
                :placeholder="$t('pim.enter_employee_id')"
              />
            </oxd-grid-item>
            <oxd-grid-item>
              <oxd-input-field
                v-model="employee.studentId"
                :label="$t('pim.student_id')"
                :rules="rules.studentId"
                :placeholder="$t('pim.enter_student_id')"
              />
            </oxd-grid-item>
            <oxd-grid-item>
              <oxd-input-field
                v-model="employee.facultyId"
                :label="$t('pim.faculty_id')"
                :rules="rules.facultyId"
                :placeholder="$t('pim.enter_faculty_id')"
              />
            </oxd-grid-item>
          </oxd-grid>
          
          <oxd-grid :cols="3" class="orangehrm-full-width-grid">
            <oxd-grid-item>
              <oxd-input-field
                v-model="employee.nickname"
                :label="$t('pim.nickname')"
                :rules="rules.nickname"
                :placeholder="$t('pim.enter_nickname')"
              />
            </oxd-grid-item>
            <oxd-grid-item>
              <oxd-input-field
                v-model="employee.otherId"
                :label="$t('pim.other_id')"
                :rules="rules.otherId"
                :placeholder="$t('pim.enter_other_id')"
              />
            </oxd-grid-item>
            <oxd-grid-item>
              <oxd-input-field
                v-model="employee.academicRank"
                :label="$t('pim.academic_rank')"
                :rules="rules.academicRank"
                :placeholder="$t('pim.enter_academic_rank')"
              />
            </oxd-grid-item>
          </oxd-grid>
        </oxd-form-row>

        <!-- Personal Information Section -->
        <oxd-text class="orangehrm-sub-title" tag="h6">
          {{ $t('pim.personal_information') }}
        </oxd-text>
        <oxd-divider />
        
        <oxd-form-row>
          <oxd-grid :cols="3" class="orangehrm-full-width-grid">
            <oxd-grid-item>
              <date-input
                v-model="employee.birthday"
                :label="$t('pim.date_of_birth')"
                :rules="rules.birthday"
              />
            </oxd-grid-item>
            <oxd-grid-item>
              <oxd-input-field
                v-model="employee.gender"
                type="select"
                :label="$t('pim.gender')"
                :options="genderOptions"
                :rules="rules.gender"
              />
            </oxd-grid-item>
            <oxd-grid-item>
              <oxd-input-field
                v-model="employee.maritalStatus"
                type="select"
                :label="$t('pim.marital_status')"
                :options="maritalStatuses"
                :rules="rules.maritalStatus"
              />
            </oxd-grid-item>
          </oxd-grid>
          
          <oxd-grid :cols="3" class="orangehrm-full-width-grid">
            <oxd-grid-item>
              <oxd-input-field
                v-model="employee.nationality"
                type="select"
                :label="$t('pim.nationality')"
                :options="nationalities"
                :rules="rules.nationality"
              />
            </oxd-grid-item>
            <oxd-grid-item>
              <oxd-input-field
                v-model="employee.bloodType"
                type="select"
                :label="$t('pim.blood_type')"
                :options="bloodTypeOptions"
                :rules="rules.bloodType"
              />
            </oxd-grid-item>
            <oxd-grid-item>
              <oxd-input-field
                v-model="employee.religion"
                :label="$t('pim.religion')"
                :rules="rules.religion"
                :placeholder="$t('pim.enter_religion')"
              />
            </oxd-grid-item>
          </oxd-grid>
        </oxd-form-row>

        <!-- Academic Information Section -->
        <oxd-text class="orangehrm-sub-title" tag="h6">
          {{ $t('pim.academic_information') }}
        </oxd-text>
        <oxd-divider />
        
        <oxd-form-row>
          <oxd-grid :cols="3" class="orangehrm-full-width-grid">
            <oxd-grid-item>
              <oxd-input-field
                v-model="employee.department"
                :label="$t('pim.department')"
                :rules="rules.department"
                :placeholder="$t('pim.enter_department')"
              />
            </oxd-grid-item>
            <oxd-grid-item>
              <oxd-input-field
                v-model="employee.faculty"
                :label="$t('pim.faculty')"
                :rules="rules.faculty"
                :placeholder="$t('pim.enter_faculty')"
              />
            </oxd-grid-item>
            <oxd-grid-item>
              <oxd-input-field
                v-model="employee.campus"
                :label="$t('pim.campus')"
                :rules="rules.campus"
                :placeholder="$t('pim.enter_campus')"
              />
            </oxd-grid-item>
          </oxd-grid>
          
          <oxd-grid :cols="3" class="orangehrm-full-width-grid">
            <oxd-grid-item>
              <oxd-input-field
                v-model="employee.officeLocation"
                :label="$t('pim.office_location')"
                :rules="rules.officeLocation"
                :placeholder="$t('pim.enter_office_location')"
              />
            </oxd-grid-item>
            <oxd-grid-item>
              <oxd-input-field
                v-model="employee.officeHours"
                :label="$t('pim.office_hours')"
                :rules="rules.officeHours"
                :placeholder="$t('pim.enter_office_hours')"
              />
            </oxd-grid-item>
            <oxd-grid-item>
              <oxd-input-field
                v-model="employee.officePhone"
                :label="$t('pim.office_phone')"
                :rules="rules.officePhone"
                :placeholder="$t('pim.enter_office_phone')"
              />
            </oxd-grid-item>
          </oxd-grid>
        </oxd-form-row>

        <!-- Legal Documents Section -->
        <oxd-text class="orangehrm-sub-title" tag="h6">
          {{ $t('pim.legal_documents') }}
        </oxd-text>
        <oxd-divider />
        
        <oxd-form-row>
          <oxd-grid :cols="3" class="orangehrm-full-width-grid">
            <oxd-grid-item>
              <oxd-input-field
                v-model="employee.drivingLicenseNo"
                :label="$t('pim.driver_license_number')"
                :rules="rules.drivingLicenseNo"
                :disabled="!$can.update(`personal_sensitive_information`)"
                :placeholder="$t('pim.enter_driver_license')"
              />
            </oxd-grid-item>
            <oxd-grid-item>
              <date-input
                v-model="employee.drivingLicenseExpiredDate"
                :rules="rules.drivingLicenseExpiredDate"
                :label="$t('pim.license_expiry_date')"
              />
            </oxd-grid-item>
            <oxd-grid-item>
              <oxd-input-field
                v-model="employee.passportNumber"
                :label="$t('pim.passport_number')"
                :rules="rules.passportNumber"
                :placeholder="$t('pim.enter_passport_number')"
              />
            </oxd-grid-item>
          </oxd-grid>
          
          <oxd-grid :cols="3" class="orangehrm-full-width-grid">
            <oxd-grid-item v-if="showSsnField">
              <oxd-input-field
                v-model="employee.ssnNumber"
                :label="$t('pim.ssn_number')"
                :rules="rules.ssnNumber"
                :disabled="!$can.update(`personal_sensitive_information`)"
                :placeholder="$t('pim.enter_ssn_number')"
              />
            </oxd-grid-item>
            <oxd-grid-item v-if="showSinField">
              <oxd-input-field
                v-model="employee.sinNumber"
                :label="$t('pim.sin_number')"
                :rules="rules.sinNumber"
                :disabled="!$can.update(`personal_sensitive_information`)"
                :placeholder="$t('pim.enter_sin_number')"
              />
            </oxd-grid-item>
            <oxd-grid-item>
              <oxd-input-field
                v-model="employee.nationalId"
                :label="$t('pim.national_id')"
                :rules="rules.nationalId"
                :placeholder="$t('pim.enter_national_id')"
              />
            </oxd-grid-item>
          </oxd-grid>
        </oxd-form-row>

        <!-- Additional Information Section -->
        <oxd-divider v-if="showDeprecatedFields" />
        <oxd-form-row v-if="showDeprecatedFields">
          <oxd-grid :cols="3" class="orangehrm-full-width-grid">
            <oxd-grid-item>
              <oxd-input-field
                v-model="employee.militaryService"
                :label="$t('pim.military_service')"
                :rules="rules.militaryService"
                :placeholder="$t('pim.enter_military_service')"
              />
            </oxd-grid-item>
            <oxd-grid-item>
              <oxd-input-field
                v-model="employee.smoker"
                type="checkbox"
                :label="$t('pim.smoker')"
                :option-label="$t('general.yes')"
              />
            </oxd-grid-item>
            <oxd-grid-item>
              <oxd-input-field
                v-model="employee.disability"
                type="checkbox"
                :label="$t('pim.disability')"
                :option-label="$t('general.yes')"
              />
            </oxd-grid-item>
          </oxd-grid>
        </oxd-form-row>

        <oxd-divider />
        <oxd-form-actions>
          <required-text />
          <submit-button />
        </oxd-form-actions>
      </oxd-form>
    </div>
  </edit-employee-layout>
</template>

<script>
import {APIService} from '@ohrm/core/util/services/api.service';
import EditEmployeeLayout from '@/orangehrmPimPlugin/components/EditEmployeeLayout';
import FullNameInput from '@/orangehrmPimPlugin/components/FullNameInput';
import {
  required,
  shouldNotExceedCharLength,
  validDateFormat,
} from '@ohrm/core/util/validation/rules';
import useDateFormat from '@/core/util/composable/useDateFormat';

const employeeModel = {
  firstName: '',
  middleName: '',
  lastName: '',
  employeeId: '',
  studentId: '',
  facultyId: '',
  otherId: '',
  drivingLicenseNo: '',
  drivingLicenseExpiredDate: '',
  ssnNumber: '',
  sinNumber: '',
  passportNumber: '',
  nationalId: '',
  nationality: [],
  maritalStatus: [],
  birthday: '',
  gender: '',
  bloodType: '',
  religion: '',
  nickname: '',
  smoker: '',
  militaryService: '',
  disability: '',
  academicRank: '',
  department: '',
  faculty: '',
  campus: '',
  officeLocation: '',
  officeHours: '',
  officePhone: '',
};

export default {
  components: {
    'edit-employee-layout': EditEmployeeLayout,
    'full-name-input': FullNameInput,
  },

  props: {
    empNumber: {
      type: String,
      required: true,
    },
    nationalities: {
      type: Array,
      default: () => [],
    },
    showDeprecatedFields: {
      type: Boolean,
      default: false,
    },
    showSsnField: {
      type: Boolean,
      default: false,
    },
    showSinField: {
      type: Boolean,
      default: false,
    },
  },

  setup(props) {
    const http = new APIService(
      window.appGlobal.baseUrl,
      `/api/v2/pim/employees/${props.empNumber}/personal-details`,
    );
    const {userDateFormat} = useDateFormat();

    return {
      http,
      userDateFormat,
    };
  },

  data() {
    return {
      isLoading: false,
      employee: {...employeeModel},
      rules: {
        firstName: [required, shouldNotExceedCharLength(30)],
        middleName: [shouldNotExceedCharLength(30)],
        lastName: [required, shouldNotExceedCharLength(30)],
        employeeId: [shouldNotExceedCharLength(10)],
        studentId: [shouldNotExceedCharLength(20)],
        facultyId: [shouldNotExceedCharLength(20)],
        otherId: [shouldNotExceedCharLength(30)],
        drivingLicenseNo: [shouldNotExceedCharLength(30)],
        ssnNumber: [shouldNotExceedCharLength(30)],
        sinNumber: [shouldNotExceedCharLength(30)],
        passportNumber: [shouldNotExceedCharLength(30)],
        nationalId: [shouldNotExceedCharLength(30)],
        nickname: [shouldNotExceedCharLength(30)],
        militaryService: [shouldNotExceedCharLength(30)],
        academicRank: [shouldNotExceedCharLength(50)],
        department: [shouldNotExceedCharLength(100)],
        faculty: [shouldNotExceedCharLength(100)],
        campus: [shouldNotExceedCharLength(100)],
        officeLocation: [shouldNotExceedCharLength(100)],
        officeHours: [shouldNotExceedCharLength(100)],
        officePhone: [shouldNotExceedCharLength(20)],
        religion: [shouldNotExceedCharLength(50)],
        birthday: [validDateFormat(this.userDateFormat)],
        drivingLicenseExpiredDate: [validDateFormat(this.userDateFormat)],
      },
      maritalStatuses: [
        {id: 'Single', label: this.$t('pim.single')},
        {id: 'Married', label: this.$t('pim.married')},
        {id: 'Other', label: this.$t('pim.other')},
      ],
      genderOptions: [
        {id: 'Male', label: this.$t('pim.male')},
        {id: 'Female', label: this.$t('pim.female')},
        {id: 'Other', label: this.$t('pim.other')},
      ],
      bloodTypeOptions: [
        {id: 'A+', label: 'A+'},
        {id: 'A-', label: 'A-'},
        {id: 'B+', label: 'B+'},
        {id: 'B-', label: 'B-'},
        {id: 'AB+', label: 'AB+'},
        {id: 'AB-', label: 'AB-'},
        {id: 'O+', label: 'O+'},
        {id: 'O-', label: 'O-'},
      ],
    };
  },

  beforeMount() {
    this.isLoading = true;
    this.http
      .getAll()
      .then((response) => {
        this.updateModel(response);
      })
      .finally(() => {
        this.isLoading = false;
      });
  },

  methods: {
    onSave() {
      this.isLoading = true;
      this.http
        .request({
          method: 'PUT',
          data: {
            lastName: this.employee.lastName,
            firstName: this.employee.firstName,
            middleName: this.employee.middleName,
            employeeId: this.employee.employeeId,
            studentId: this.employee.studentId,
            facultyId: this.employee.facultyId,
            otherId: this.employee.otherId,
            drivingLicenseNo: this.employee.drivingLicenseNo,
            drivingLicenseExpiredDate: this.employee.drivingLicenseExpiredDate,
            gender: this.employee.gender,
            maritalStatus: this.employee.maritalStatus?.id,
            birthday: this.employee.birthday,
            nationalityId: this.employee.nationality?.id,
            bloodType: this.employee.bloodType,
            religion: this.employee.religion,
            passportNumber: this.employee.passportNumber,
            nationalId: this.employee.nationalId,
            ssnNumber: this.showSsnField ? this.employee.ssnNumber : undefined,
            sinNumber: this.showSinField ? this.employee.sinNumber : undefined,
            nickname: this.showDeprecatedFields
              ? this.employee.nickname
              : undefined,
            smoker: this.showDeprecatedFields
              ? this.employee.smoker
              : undefined,
            militaryService: this.showDeprecatedFields
              ? this.employee.militaryService
              : undefined,
            disability: this.showDeprecatedFields
              ? this.employee.disability
              : undefined,
            academicRank: this.employee.academicRank,
            department: this.employee.department,
            faculty: this.employee.faculty,
            campus: this.employee.campus,
            officeLocation: this.employee.officeLocation,
            officeHours: this.employee.officeHours,
            officePhone: this.employee.officePhone,
          },
        })
        .then((response) => {
          this.updateModel(response);
          return this.$toast.updateSuccess();
        })
        .then(() => {
          this.isLoading = false;
        });
    },

    updateModel(response) {
      const {data} = response.data;
      this.employee = {...employeeModel, ...data};
      this.employee.maritalStatus = this.maritalStatuses.find(
        (item) => item.id === data.maritalStatus,
      );
      this.employee.nationality = this.nationalities.find(
        (item) => item.id === data.nationality?.id,
      );
      this.employee.gender = this.genderOptions.find(
        (item) => item.id === data.gender,
      );
      this.employee.bloodType = this.bloodTypeOptions.find(
        (item) => item.id === data.bloodType,
      );
    },
  },
};
</script>

<style src="./employee.scss" lang="scss" scoped></style>
