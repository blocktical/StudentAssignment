const ProductOrder = artifacts.require("ProductOrder");

module.exports = function (deployer) {
  deployer.deploy(ProductOrder);
};
