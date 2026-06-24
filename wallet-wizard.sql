--
-- PostgreSQL database dump
--

\restrict zRmHavZhMnHlGGBaO8jxOqwBdPgocjxfuuUpDo7wDpDLWBSPQMjVThyNcMKyGN7

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    name text NOT NULL,
    type text NOT NULL,
    balance integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone
);


ALTER TABLE public.account OWNER TO postgres;

--
-- Name: app_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_user (
    id uuid NOT NULL,
    email text NOT NULL,
    password_hash text NOT NULL,
    display_name text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone,
    profile_picture text
);


ALTER TABLE public.app_user OWNER TO postgres;

--
-- Name: budget; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.budget (
    id uuid NOT NULL,
    category_id uuid NOT NULL,
    name text NOT NULL,
    amount integer NOT NULL,
    period text NOT NULL,
    start_date timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id uuid NOT NULL,
    deleted_at timestamp without time zone
);


ALTER TABLE public.budget OWNER TO postgres;

--
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id uuid NOT NULL,
    name text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone,
    user_id uuid NOT NULL
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: recurring_transaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recurring_transaction (
    id uuid NOT NULL,
    category_id uuid NOT NULL,
    account_id uuid NOT NULL,
    name text NOT NULL,
    amount integer NOT NULL,
    frequency text NOT NULL,
    next_run_on date NOT NULL,
    is_active boolean NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone
);


ALTER TABLE public.recurring_transaction OWNER TO postgres;

--
-- Name: transaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaction (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    name text NOT NULL,
    category_id uuid NOT NULL,
    account_id uuid NOT NULL,
    amount integer NOT NULL,
    date date NOT NULL,
    description text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone
);


ALTER TABLE public.transaction OWNER TO postgres;

--
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account (id, user_id, name, type, balance, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: app_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_user (id, email, password_hash, display_name, created_at, updated_at, deleted_at, profile_picture) FROM stdin;
\.


--
-- Data for Name: budget; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.budget (id, category_id, name, amount, period, start_date, created_at, updated_at, user_id, deleted_at) FROM stdin;
\.


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (id, name, created_at, updated_at, deleted_at, user_id) FROM stdin;
\.


--
-- Data for Name: recurring_transaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recurring_transaction (id, category_id, account_id, name, amount, frequency, next_run_on, is_active, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: transaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transaction (id, user_id, name, category_id, account_id, amount, date, description, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Name: account account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (id);


--
-- Name: app_user app_user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT app_user_email_key UNIQUE (email);


--
-- Name: app_user app_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT app_user_pkey PRIMARY KEY (id);


--
-- Name: budget budget_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.budget
    ADD CONSTRAINT budget_pkey PRIMARY KEY (id);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: recurring_transaction recurring_transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recurring_transaction
    ADD CONSTRAINT recurring_transaction_pkey PRIMARY KEY (id);


--
-- Name: transaction transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_pkey PRIMARY KEY (id);


--
-- Name: account account_app_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_app_user_fk FOREIGN KEY (user_id) REFERENCES public.app_user(id);


--
-- Name: budget budget_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.budget
    ADD CONSTRAINT budget_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- Name: budget budget_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.budget
    ADD CONSTRAINT budget_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.app_user(id);


--
-- Name: recurring_transaction recurring_transaction_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recurring_transaction
    ADD CONSTRAINT recurring_transaction_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.account(id);


--
-- Name: recurring_transaction recurring_transaction_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recurring_transaction
    ADD CONSTRAINT recurring_transaction_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- Name: transaction transaction_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.account(id);


--
-- Name: transaction transaction_app_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_app_user_fkey FOREIGN KEY (account_id) REFERENCES public.app_user(id);


--
-- Name: transaction transaction_category_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_category_fk FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- PostgreSQL database dump complete
--

\unrestrict zRmHavZhMnHlGGBaO8jxOqwBdPgocjxfuuUpDo7wDpDLWBSPQMjVThyNcMKyGN7

