with payment as (
    select 
        id as payment_id,
        orderid as order_id,
        paymentmethod,
        status,
        -- amount is stored in cents, convert it to dollars
        amount / 100 as amount,
        created,
        _batched_at 
    from {{ source('stripe', 'payment') }}
)

select * from payment