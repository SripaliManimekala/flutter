
module.exports = {


  friendlyName: 'Add employee',


  description: '',


  inputs: {
    emp_code: {type:'string', required: true},
    emp_name: {type:'string', required: true},
    emp_email: { type: 'string', required: true },
    emp_mobile: { type: 'string', allowNull: true },
    emp_salary: { type: 'number', required: true},
    department_id: {type: 'number', required: true},
  },


  exits: {

  },


  fn: async function (inputs,exits) {

    let check_employee = await Employee.findOne({
      emp_email: inputs.emp_email,
    });

    if(check_employee) {
      return exits.success({
        status: false,
        error: "Employee with same Email Already Exits",
        code: 1
      });
    }

    const new_employee = await Employee.create({
      emp_code: inputs.emp_code,
      emp_name: inputs.emp_name,
      emp_email: inputs.emp_email,
      emp_mobile: inputs.emp_mobile,
      emp_salary: inputs.emp_salary,
      department_id: inputs.department_id,
    }).fetch();

    if(new_employee) {
      return exits.success({
        status: true,
        new_employee
      })
    } else {
      return exits.success({
        status: false,
        error: 'no employee created!',
        code: 2
      })
    }

  }

};
