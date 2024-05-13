module.exports = {


  friendlyName: 'Get employee',


  description: '',


  inputs: {
    id: {
      type: 'number',
      required: true,
    }
  },


  exits: {

  },


  fn: async function (inputs, exits) {

    const employee = await Employee.findOne({id: inputs.id})
      .populate('department_id');

    if(!employee) {
      return exits.success({
        status: false,
        error: "no employee  with this id"
      });
    } else {
      return exits.success({
        status: true,
        employee: employee
      });
    }


  }


};
