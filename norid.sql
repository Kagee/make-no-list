CREATE TABLE norid
(
  fqdn character varying(150) NOT NULL,
  a_data text,
  a_timestamp timestamp with time zone,
  w_data text,
  w_timestamp timestamp with time zone,
  mx_data text,
  mx_timestamp timestamp with time zone,
  soa_data text,
  soa_timestamp timestamp with time zone,
  finger_data text,
  finger_timestamp timestamp with time zone,
  CONSTRAINT norid_pkey PRIMARY KEY (fqdn)
)
