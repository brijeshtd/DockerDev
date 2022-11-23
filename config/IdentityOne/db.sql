﻿CREATE TABLE IF NOT EXISTS "__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL,
    CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId")
);

START TRANSACTION;

CREATE TABLE accounts (
    account_id bigint GENERATED BY DEFAULT AS IDENTITY,
    username character varying(50) NOT NULL,
    mobile character varying(50) NOT NULL,
    email_id character varying(50) NOT NULL,
    password character varying(250) NOT NULL,
    email_verification boolean NOT NULL,
    mobile_verification boolean NOT NULL,
    record_status character varying(50) NOT NULL,
    created_ip character varying(50) NOT NULL,
    created_by bigint NOT NULL,
    created_on timestamp NOT NULL,
    updated_by bigint NOT NULL,
    updated_on timestamp NOT NULL,
    CONSTRAINT "PK_accounts" PRIMARY KEY (account_id)
);

CREATE TABLE email_verify (
    email_verify_id bigint GENERATED BY DEFAULT AS IDENTITY,
    email_id text NOT NULL,
    email_verify_token text NOT NULL,
    creation_time timestamp NOT NULL,
    expiry_time timestamp NOT NULL,
    used character(1) NOT NULL,
    verify_creation_ip text NOT NULL,
    verify_utilized_ip text NOT NULL,
    verify_utilized_time timestamp NULL,
    CONSTRAINT "PK_email_verify" PRIMARY KEY (email_verify_id)
);

CREATE TABLE email_verify_undelivered (
    email_verify_fail_id bigint GENERATED BY DEFAULT AS IDENTITY,
    email_id text NOT NULL,
    email_verify_token text NOT NULL,
    delivery_status character(1) NOT NULL,
    successful_delivery_time timestamp NULL,
    CONSTRAINT "PK_email_verify_undelivered" PRIMARY KEY (email_verify_fail_id)
);

CREATE TABLE permissions (
    permission_id bigint GENERATED BY DEFAULT AS IDENTITY,
    permission_name character varying(50) NOT NULL,
    record_status character varying(50) NOT NULL,
    CONSTRAINT "PK_permissions" PRIMARY KEY (permission_id)
);

CREATE TABLE roles (
    role_id bigint GENERATED BY DEFAULT AS IDENTITY,
    role_name character varying(50) NOT NULL,
    role_label character varying(50) NOT NULL,
    role_level integer NOT NULL,
    record_status character varying(50) NOT NULL,
    CONSTRAINT "PK_roles" PRIMARY KEY (role_id)
);

CREATE TABLE jwts (
    jwt_id bigint GENERATED BY DEFAULT AS IDENTITY,
    account_id bigint NOT NULL,
    username text NOT NULL,
    mobile text NOT NULL,
    email_id text NOT NULL,
    role_name text NOT NULL,
    client_app text NOT NULL,
    jwt_token text NOT NULL,
    creation_time timestamp NOT NULL,
    expiry_time timestamp NOT NULL,
    creation_ip text NOT NULL,
    CONSTRAINT "PK_jwts" PRIMARY KEY (jwt_id),
    CONSTRAINT "FK_jwts_accounts_account_id" FOREIGN KEY (account_id) REFERENCES accounts (account_id) ON DELETE CASCADE
);

CREATE TABLE account_roles (
    account_role_id bigint GENERATED BY DEFAULT AS IDENTITY,
    account_id bigint NOT NULL,
    role_id bigint NOT NULL,
    client_app character varying(50) NOT NULL,
    record_status character varying(50) NOT NULL,
    created_by bigint NOT NULL,
    created_on timestamp NOT NULL,
    updated_by bigint NOT NULL,
    updated_on timestamp NOT NULL,
    CONSTRAINT "PK_account_roles" PRIMARY KEY (account_role_id),
    CONSTRAINT "FK_account_roles_accounts_account_id" FOREIGN KEY (account_id) REFERENCES accounts (account_id) ON DELETE CASCADE,
    CONSTRAINT "FK_account_roles_roles_role_id" FOREIGN KEY (role_id) REFERENCES roles (role_id) ON DELETE CASCADE
);

CREATE TABLE permission_role (
    role_id bigint NOT NULL,
    permission_id bigint NOT NULL,
    CONSTRAINT "PK_permission_role" PRIMARY KEY (role_id, permission_id),
    CONSTRAINT "FK_permission_role_permissions_permission_id" FOREIGN KEY (permission_id) REFERENCES permissions (permission_id) ON DELETE CASCADE,
    CONSTRAINT "FK_permission_role_roles_role_id" FOREIGN KEY (role_id) REFERENCES roles (role_id) ON DELETE CASCADE
);

CREATE UNIQUE INDEX "IX_account_roles_account_id_role_id" ON account_roles (account_id, role_id);

CREATE INDEX "IX_account_roles_role_id" ON account_roles (role_id);

CREATE UNIQUE INDEX "IX_accounts_email_id" ON accounts (email_id);

CREATE UNIQUE INDEX "IX_accounts_mobile" ON accounts (mobile);

CREATE UNIQUE INDEX "IX_accounts_username" ON accounts (username);

CREATE INDEX "IX_jwts_account_id" ON jwts (account_id);

CREATE INDEX "IX_permission_role_permission_id" ON permission_role (permission_id);

CREATE UNIQUE INDEX "IX_permissions_permission_name" ON permissions (permission_name);

CREATE UNIQUE INDEX "IX_roles_role_label" ON roles (role_label);

CREATE UNIQUE INDEX "IX_roles_role_name" ON roles (role_name);

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20221013194050_Initial', '6.0.9');

COMMIT;

