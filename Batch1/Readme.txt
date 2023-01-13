TRUFFLE - [SC side complete]
Step1: sudo npm install -g truffle
Step2: truffle init
Contracts -> contracts Folder <mycontract.sol>
Migrations -> migrations Folder <migration of mycontract.sol>.js
Step3: truffle compile
    Creates Build for the contracts 
        Application Binary Interface [ABI] = Communication between Application and smart contracts
        Bytecode = EVM based operation codes [opcode]
        Metadata = Data of a Data


GETH - [Network Creation]
Blockchain start => Chain of blocks
        Start -> 0th block => Genesis Block
                            blockchain -> configurations
    genesis.json [javascript object notation]



    "0x81afc66335664a444eab2f67be845c5ec9e0be65" <> "tanuj"
    "0x7973b0fe306e2e65f877d80735f5e934f23126b9" <> "ck"

    
    geth --datadir ./datadir --networkid <networkid> --rpc --rpcport <port> --allow-insecure-unlock console
    personal.netAccount("password")
    personal.unlockAccount("<account address>","password",0)
    miner.start()

    miner.stop()



TRUFFLE-
    truffle migrate --network GETH
    truffle console --network GETH
    let _SC = await SC.deployed()





