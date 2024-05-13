
module.exports = {


  friendlyName: 'Get sum of salary',


  description: '',


  inputs: {},


  exits: {},


  fn: async function (inputs, exits) {

    const employees = await Employee.find();

    // let total=0;
    // employees.forEach((emp) => {
    //   total += emp.emp_salary;
    // });

    let total = await Employee.sum('emp_salary');

    return exits.success({
      status: true,
      total : total
    });

  }


};
