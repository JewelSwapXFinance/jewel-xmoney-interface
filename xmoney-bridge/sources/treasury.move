module xmoney_bridge::treasury {
    public struct Treasury<phantom T0> has key {
        id: sui::object::UID,
    }

    public struct ToCoinCap<phantom T0> has store, key {
        id: sui::object::UID,
    }
}
