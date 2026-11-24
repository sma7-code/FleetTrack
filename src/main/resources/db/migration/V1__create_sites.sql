CREATE TABLE sites (
    id              BIGINT        NOT NULL AUTO_INCREMENT,
    name            VARCHAR(150)  NOT NULL,
    client_name     VARCHAR(150)  NULL,
    address         VARCHAR(255)  NULL,
    city            VARCHAR(80)   NULL,
    state           VARCHAR(80)   NULL,
    contact_person  VARCHAR(100)  NULL,
    contact_number  VARCHAR(20)   NULL,
    start_date      DATE          NULL,
    status          VARCHAR(20)   NOT NULL DEFAULT 'ACTIVE',
    remarks         VARCHAR(500)  NULL,
    created_at      DATETIME(6)   NOT NULL,
    created_by      BIGINT        NULL,
    updated_at      DATETIME(6)   NOT NULL,
    updated_by      BIGINT        NULL,
    PRIMARY KEY (id),
    CONSTRAINT uk_sites_name UNIQUE (name),
    CONSTRAINT chk_sites_status CHECK (status IN ('ACTIVE', 'INACTIVE'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE INDEX idx_sites_client_name ON sites (client_name);