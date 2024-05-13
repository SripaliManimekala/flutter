module.exports = {


  friendlyName: 'Get all employee',


  description: '',


  inputs: {},


  exits: {},


  fn: async function (inputs, exits) {
    try{
      const all_employees = await Employee.find().sort('emp_salary ASC');

      return exits.success({
        status: true,
        employees: all_employees
      });
    } catch(error) {
      return exits.badRequest({
        message: 'Error occurred while fetching' + error
    });
    }

  }
};
