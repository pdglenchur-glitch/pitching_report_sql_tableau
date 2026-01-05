-- View: public.pitches_analytics

-- DROP VIEW public.pitches_analytics;

CREATE OR REPLACE VIEW public.pitches_analytics
 AS
 SELECT pitcher,
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
    pitchno,
    row_number() OVER (ORDER BY session_date, pitchno) AS pitch_no_seq,
    platelocside * 12.0::double precision AS plate_side_in,
    LEAST(GREATEST(platelocside * 12.0::double precision, '-20'::integer::double precision), 20::double precision) AS plate_side_in_clamped,
    LEAST(GREATEST(platelocheight, 0::double precision), 5.5::double precision) AS plate_height_ft_clamped,
        CASE
            WHEN (platelocside * 12.0::double precision) >= ('-8.5'::numeric - 2.85)::double precision AND (platelocside * 12.0::double precision) <= (8.5 + 2.85)::double precision AND platelocheight >= (1.5 - 2.85 / 12.0)::double precision AND platelocheight <= (3.5 + 2.85 / 12.0)::double precision THEN 1
            ELSE 0
        END AS in_pzr_zone
   FROM pitches_raw;
