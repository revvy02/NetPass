export type NetData = (table | boolean | string | number | Instance)?

export type PairData = {
    k: NetData,
    v: NetData,
    d: KeyData
}

export type KeyData = {
    PairData
}

export type MetaData = {
    KeyData?
}?

return {}