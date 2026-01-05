-- Table: public.pitches_raw

-- DROP TABLE IF EXISTS public.pitches_raw;

CREATE TABLE IF NOT EXISTS public.pitches_raw
(
    pitcher text COLLATE pg_catalog."default",
    taggedpitchtype text COLLATE pg_catalog."default",
    relspeed double precision,
    horzbreak double precision,
    inducedvertbreak double precision,
    spinrate double precision,
    horzapprangle double precision,
    vertapprangle double precision,
    platelocside double precision,
    platelocheight double precision,
    session_date date,
    pitchno integer
)

TABLESPACE pg_default;
