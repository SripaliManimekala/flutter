
module.exports = {


  friendlyName: 'Delete employee',


  description: '',


  inputs: {
    id: {
      type: 'number',
      required: true,
    }
  },


  exits: {},


  fn: async function (inputs, exits) {

    var check_employee = await Employee.findOne({
      id: inputs.id,
    });

    if(!check_employee) {
      return exits.success({
        status: false,
        error: "Employee Not Found"
      });
    }

    await Employee.destroy({id: inputs.id});

    return exits.success({
      status: true,
      message: "Successfully deleted the employee."
    });
  }


};
