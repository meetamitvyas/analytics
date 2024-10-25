{% snapshot mock_orders_snapshot %}

    {% set new_schema = target.schema + '_snapshot' %}

    {{
        config(
            target_database="ANALYTICS",
            target_schema="JAFFLE_SHOP",
            unique_key="Order_id",
            strategy="timestamp",
            updated_at="updated_at",
        )
    }}

    select *
    from raw.{{ target.schema }}.mock_orders

{% endsnapshot %}
