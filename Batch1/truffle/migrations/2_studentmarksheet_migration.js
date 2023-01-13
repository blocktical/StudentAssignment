const StudentMarksheet = artifacts.require("StudentMarksheet");
module.exports = function (deployer) {
  deployer.deploy(StudentMarksheet);
};