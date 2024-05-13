

module.exports = {


  friendlyName: 'Edit employee',


  description: '',


  inputs: {
    id: { required: true, type: 'number' },
    emp_code: {type:'string', required: true},
    emp_name: {type:'string', required: true},
    emp_email: { type: 'string', required: true },
    emp_mobile: { type: 'string', allowNull: true },
    emp_salary: { type: 'number', allowNull: true },
    department_id: {type: 'number', required: true},
  },


  exits: {

  },


  fn: async function (inputs, exits) {

    const check_employee = await Employee.findOne({
      id: inputs.id,
    });

    if(!check_employee) {
      return exits.success({
        status: false,
        error: "Employee Not Found"
      });
    }
    
    const duplicateEmployee = await Employee.findOne({
      emp_email: inputs.emp_email,
      id: {'!=': inputs.id}//check if records with same mail as in request exists other than provided id
    }); 

    if(duplicateEmployee) {
      return exits.success({
        status: false,
        error: "Email Alreay exits"
      });
    }

    await  Employee.updateOne({id : inputs.id}).set({
      emp_code: inputs.emp_code,
      emp_name: inputs.emp_name,
      emp_email: inputs.emp_email,
      emp_mobile: inputs.emp_mobile,
      emp_salary: inputs.emp_salary,
      department_id: inputs.department_id,

    });

    return exits.success({
      status: true,
      message: "Successfully Updated The Employee",
    });

  }


};
