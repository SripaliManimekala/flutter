module.exports = {


  friendlyName: 'Get all department',


  description: '',


  inputs: {},


  exits: {

  },


  fn: async function (inputs,exits) {

    const all_departments = await Department.find();

    return exits.success({
      status: true,
      departments: all_departments
    });

  }

};
