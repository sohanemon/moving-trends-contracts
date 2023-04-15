## Getting Started

```bash
npx thirdweb create --contract
```

## `struct` - the `type` keyword of solidity

a `struct` in Solidity can be compared to a `type` in TypeScript.
Both allow you to define your own custom data types with multiple properties.

```csharp
struct Campaign {
        address owner;
        string title;
        uint256 deadline;
        string image;
        address[] donators;
    }
```

## `mapping`

```csharp
mapping(address => uint) public balances;
```

`address` is the key type and `uint` is the value type. And the variable name is `balances`.

And will be used as like `array`

```csharp
balances[something] = 100;
```

## `memory` keyword

If you pass a very large variable, like an array, as a parameter to a function, storing that data permanently on the blockchain can be very expensive in terms of gas fees. This is where "memory" comes in.

When you add "memory" to a function parameter, you're telling Solidity to store that variable's data temporarily in memory while the function is being executed.

```csharp
 function createCampaign(
        address _owner,
        string memory _title
    ) public returns (uint256) {}
```
