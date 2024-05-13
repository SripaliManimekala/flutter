module.exports = {


  friendlyName: 'Get count employee',


  description: '',


  inputs: {

  },


  exits: {

  },


  fn: async function (inputs, exits) {

    const total_employees = await Employee.count();

    return exits.success({
      status: true,
      count: total_employees
    });

  }


};
