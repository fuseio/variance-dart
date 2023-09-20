
import 'package:web3dart/credentials.dart';

import '../common.dart';

enum Chain {
  // mainnet
  mainnet,
  optimism,
  base,
  polygonZ,
  // testnet
  sepolia,
  op_goerli,
  base_goerli,
  // localhost
  localhost
}

///[IChain]
///
/// Holds information about a chain 
/// 
/// and allows for wallet to interact with different chains
class IChain {
  final int chainId;
  final String explorer;
  String? rpcUrl;
  String? bundlerUrl;
  EthereumAddress entrypoint;
  IChain(
      {required this.chainId,
      required this.explorer,
      this.rpcUrl,
      required this.entrypoint,
      this.bundlerUrl});

  void setRpcUrl(String? value) {
    rpcUrl = value;
  }

  void setBundlerUrl(String? value) {
    bundlerUrl = value;
  }

  void setEntrypoint(EthereumAddress value) {
    entrypoint = value;
  }

  /// asserts that [rpcUrl] and [bundlerUrl] are valid
  IChain validate() {
    require(rpcUrl != null && rpcUrl!.isNotEmpty,
        "Chain: please provide a valid url for rpcUrl");
    require(bundlerUrl != null && bundlerUrl!.isNotEmpty,
        "Chain: please provide a valid url for bundlerUrl");
    return this;
  }
}

class Chains {
  Chains._();
  static EthereumAddress entrypoint = EthereumAddress.fromHex(
      "0x5FF137D4b0FDCD49DcA30c7CF57E578a026d2789",
      enforceEip55: true);
  static EthereumAddress zeroAddress =
      EthereumAddress.fromHex("0x0000000000000000000000000000000000000000");
  static EthereumAddress simpleAccountFactory = EthereumAddress.fromHex(
      "0x9406Cc6185a346906296840746125a0E44976454",
      enforceEip55: true);

  static Map<Chain, IChain> chains = {
    Chain.mainnet: IChain(
        chainId: 1,
        explorer: "https://etherscan.io/",
        rpcUrl: "https://rpc.ankr.com/eth",
        entrypoint: entrypoint),
    Chain.optimism: IChain(
        chainId: 10,
        explorer: "https://explorer.optimism.io",
        rpcUrl: "https://mainnet.optimism.io",
        entrypoint: entrypoint),
    Chain.base: IChain(
        chainId: 8453,
        explorer: "https://basescan.org",
        rpcUrl: "https://mainnet.base.org",
        entrypoint: entrypoint),
    Chain.polygonZ: IChain(
        chainId: 1101,
        explorer: "https://zkevm.polygonscan.com/",
        rpcUrl: "https://rpc.ankr.com/polygon_zkevm",
        entrypoint: entrypoint),
    Chain.sepolia: IChain(
        chainId: 11155111,
        explorer: "https://sepolia.etherscan.io/",
        rpcUrl: "https://rpc.sepolia.org",
        entrypoint: entrypoint),
    Chain.op_goerli: IChain(
        chainId: 420,
        explorer: "https://goerli-explorer.optimism.io",
        rpcUrl: "https://goerli.optimism.io",
        entrypoint: entrypoint),
    Chain.base_goerli: IChain(
        chainId: 84531,
        explorer: "https://goerli.basescan.org",
        rpcUrl: "https://goerli.base.org",
        entrypoint: entrypoint),
    Chain.localhost: IChain(
        chainId: 1337,
        explorer: "http://10.0.2.2:8545",
        rpcUrl: "http://10.0.2.2:8545",
        entrypoint: entrypoint,
        bundlerUrl: "http://10.0.2.2:3000/rpc")
  };

  static IChain? getChain(Chain entrypoint) {
    return chains[entrypoint];
  }
}