module xmoney_staking::staking_factory {
    use sui::coin::Coin;
    use sui::clock::Clock;
    use sui::token::Token;
    use xmoney_bridge::treasury::Treasury;

    public struct StakingFactory<phantom T0, phantom T1, phantom T2> has store, key {
        id: sui::object::UID,
    }

    public struct OpenPosition<phantom T0> has store, key {
        id: sui::object::UID,
    }

    public struct UnbondingTicket<phantom T0> has store, key {
        id: sui::object::UID,
    }

    // Sync pool accrual state — call before claim or claim_locked
    public fun sync<T0, T1, T2>(
        _sf: &mut StakingFactory<T0, T1, T2>,
        _clock: &Clock,
    ) { abort 0 }

    // ── Tier 0 (normal) ──────────────────────────────────────────────────────

    // Claim normal (tier-0) rewards — returns Coin<T0> to caller
    public fun claim<T0, T1, T2>(
        _sf: &mut StakingFactory<T0, T1, T2>,
        _op: &mut OpenPosition<T1>,
        _ctx: &mut TxContext,
    ): Coin<T0> { abort 0 }

    // Stake more T1 (XMN) into an existing normal position
    public fun stake_more<T0, T1, T2>(
        _sf: &mut StakingFactory<T0, T1, T2>,
        _op: &mut OpenPosition<T1>,
        _coin: Coin<T1>,
        _clock: &Clock,
        _ctx: &mut TxContext,
    ) { abort 0 }

    // Initiate unstake of normal position — xMoney transfers UnbondingTicket<T1> to tx_context::sender
    public fun request_unstake<T0, T1, T2>(
        _sf: &mut StakingFactory<T0, T1, T2>,
        _op: &mut OpenPosition<T1>,
        _amount: u64,
        _clock: &Clock,
        _ctx: &mut TxContext,
    ) { abort 0 }

    // ── Tier 1 (locked/boosted) ───────────────────────────────────────────────

    // Claim locked (tier-1 boosted) rewards — returns Coin<T0> to caller
    public fun claim_locked<T0, T1, T2>(
        _sf: &mut StakingFactory<T0, T1, T2>,
        _op: &mut OpenPosition<T2>,
        _ctx: &mut TxContext,
    ): Coin<T0> { abort 0 }

    // Stake more bridge tokens into an existing locked position
    public fun stake_more_locked<T0, T1, T2>(
        _sf: &mut StakingFactory<T0, T1, T2>,
        _treasury: &Treasury<T2>,
        _op: &mut OpenPosition<T2>,
        _token: Token<T2>,
        _clock: &Clock,
        _ctx: &mut TxContext,
    ) { abort 0 }

    // Initiate unstake of locked position — xMoney transfers UnbondingTicket<T2> to tx_context::sender
    public fun request_unstake_locked<T0, T1, T2>(
        _sf: &mut StakingFactory<T0, T1, T2>,
        _op: &mut OpenPosition<T2>,
        _amount: u64,
        _clock: &Clock,
        _ctx: &mut TxContext,
    ) { abort 0 }

    // Complete unstake after lock period — transfers Coin<T2> to tx_context::sender
    public fun unbond_locked<T0, T1, T2>(
        _sf: &mut StakingFactory<T0, T1, T2>,
        _ticket: UnbondingTicket<T2>,
        _clock: &Clock,
        _ctx: &mut TxContext,
    ) { abort 0 }
}
