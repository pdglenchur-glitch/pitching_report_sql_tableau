INSERT INTO pitches_raw (
    pitcher,
    taggedpitchtype,
    relspeed,
    horzbreak,
    inducedvertbreak,
    spinrate,
    horzapprangle,
    vertapprangle,
    platelocside,
    platelocheight,
    session_date,
    pitchno
)
SELECT
    Pitcher,
    TaggedPitchType,

    NULLIF(RelSpeed, 'RelSpeed')::DOUBLE PRECISION,
    NULLIF(HorzBreak, 'HorzBreak')::DOUBLE PRECISION,
    NULLIF(InducedVertBreak, 'InducedVertBreak')::DOUBLE PRECISION,
    NULLIF(SpinRate, 'SpinRate')::DOUBLE PRECISION,
    NULLIF(HorzApprAngle, 'HorzApprAngle')::DOUBLE PRECISION,
    NULLIF(VertApprAngle, 'VertApprAngle')::DOUBLE PRECISION,
    NULLIF(PlateLocSide, 'PlateLocSide')::DOUBLE PRECISION,
    NULLIF(PlateLocHeight, 'PlateLocHeight')::DOUBLE PRECISION,
    NULLIF(Date, 'Date')::DATE,
    NULLIF(PitchNo, 'PitchNo')::INTEGER

FROM pitches_stage
WHERE
    -- this guarantees only real numeric rows are inserted
    RelSpeed ~ '^[0-9\.\-]+$'
    AND PitchNo ~ '^[0-9]+$';
