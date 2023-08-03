WITH source AS (

    SELECT * FROM {{ source('bingeflix', 'events') }}

),

renamed AS (

    SELECT
        event_id,
        {{ weekly_periods('user_id', 'created_at') }} -- Applying the macro here

    FROM source

)

SELECT * FROM renamed
