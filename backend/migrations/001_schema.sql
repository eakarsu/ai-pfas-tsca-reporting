CREATE TABLE IF NOT EXISTS app_users(
  id BIGSERIAL PRIMARY KEY,email TEXT UNIQUE NOT NULL,name TEXT NOT NULL,role TEXT NOT NULL,password_hash TEXT NOT NULL,created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE TABLE IF NOT EXISTS workflow_cases(
  id BIGSERIAL PRIMARY KEY,workflow_id TEXT NOT NULL,reference TEXT UNIQUE NOT NULL,subject TEXT NOT NULL,owner TEXT NOT NULL,state TEXT NOT NULL,risk TEXT NOT NULL,due_date DATE NOT NULL,amount NUMERIC(16,2) NOT NULL DEFAULT 0,payload JSONB NOT NULL DEFAULT '{}'::jsonb,created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE TABLE IF NOT EXISTS audit_events(
  id BIGSERIAL PRIMARY KEY,event_time TIMESTAMPTZ NOT NULL DEFAULT NOW(),actor TEXT NOT NULL,action TEXT NOT NULL,object_type TEXT NOT NULL,object_reference TEXT NOT NULL,detail TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS saved_analyses(
  id BIGSERIAL PRIMARY KEY,workflow_id TEXT NOT NULL,actor TEXT NOT NULL,analysis_type TEXT NOT NULL,inputs JSONB NOT NULL,result JSONB NOT NULL,provider TEXT NOT NULL,model TEXT,created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE TABLE IF NOT EXISTS integration_state(
  id TEXT PRIMARY KEY,name TEXT NOT NULL,category TEXT NOT NULL,mode TEXT NOT NULL,status TEXT NOT NULL,last_tested TIMESTAMPTZ
);
CREATE INDEX IF NOT EXISTS idx_workflow_cases_workflow ON workflow_cases(workflow_id);
CREATE INDEX IF NOT EXISTS idx_workflow_cases_due ON workflow_cases(due_date);
CREATE INDEX IF NOT EXISTS idx_audit_events_time ON audit_events(event_time DESC);

CREATE TABLE IF NOT EXISTS "op_scope"(
  id BIGSERIAL PRIMARY KEY,reference TEXT UNIQUE NOT NULL,status TEXT NOT NULL,owner TEXT NOT NULL,risk TEXT NOT NULL,due_date DATE NOT NULL,amount NUMERIC(16,2) NOT NULL DEFAULT 0,
  "data_caseReference" TEXT NOT NULL,
  "data_entity" TEXT NOT NULL,
  "data_reviewDate" DATE NOT NULL,
  "data_metric" NUMERIC(16,2) NOT NULL,
  "data_evidenceNotes" TEXT NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_op_scope_due ON "op_scope"(due_date);

CREATE TABLE IF NOT EXISTS "op_substance"(
  id BIGSERIAL PRIMARY KEY,reference TEXT UNIQUE NOT NULL,status TEXT NOT NULL,owner TEXT NOT NULL,risk TEXT NOT NULL,due_date DATE NOT NULL,amount NUMERIC(16,2) NOT NULL DEFAULT 0,
  "data_caseReference" TEXT NOT NULL,
  "data_entity" TEXT NOT NULL,
  "data_reviewDate" DATE NOT NULL,
  "data_metric" NUMERIC(16,2) NOT NULL,
  "data_evidenceNotes" TEXT NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_op_substance_due ON "op_substance"(due_date);

CREATE TABLE IF NOT EXISTS "op_lookback"(
  id BIGSERIAL PRIMARY KEY,reference TEXT UNIQUE NOT NULL,status TEXT NOT NULL,owner TEXT NOT NULL,risk TEXT NOT NULL,due_date DATE NOT NULL,amount NUMERIC(16,2) NOT NULL DEFAULT 0,
  "data_caseReference" TEXT NOT NULL,
  "data_entity" TEXT NOT NULL,
  "data_reviewDate" DATE NOT NULL,
  "data_metric" NUMERIC(16,2) NOT NULL,
  "data_evidenceNotes" TEXT NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_op_lookback_due ON "op_lookback"(due_date);

CREATE TABLE IF NOT EXISTS "op_supplier"(
  id BIGSERIAL PRIMARY KEY,reference TEXT UNIQUE NOT NULL,status TEXT NOT NULL,owner TEXT NOT NULL,risk TEXT NOT NULL,due_date DATE NOT NULL,amount NUMERIC(16,2) NOT NULL DEFAULT 0,
  "data_caseReference" TEXT NOT NULL,
  "data_entity" TEXT NOT NULL,
  "data_reviewDate" DATE NOT NULL,
  "data_metric" NUMERIC(16,2) NOT NULL,
  "data_evidenceNotes" TEXT NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_op_supplier_due ON "op_supplier"(due_date);

CREATE TABLE IF NOT EXISTS "op_volume"(
  id BIGSERIAL PRIMARY KEY,reference TEXT UNIQUE NOT NULL,status TEXT NOT NULL,owner TEXT NOT NULL,risk TEXT NOT NULL,due_date DATE NOT NULL,amount NUMERIC(16,2) NOT NULL DEFAULT 0,
  "data_caseReference" TEXT NOT NULL,
  "data_entity" TEXT NOT NULL,
  "data_reviewDate" DATE NOT NULL,
  "data_metric" NUMERIC(16,2) NOT NULL,
  "data_evidenceNotes" TEXT NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_op_volume_due ON "op_volume"(due_date);

CREATE TABLE IF NOT EXISTS "op_exposure"(
  id BIGSERIAL PRIMARY KEY,reference TEXT UNIQUE NOT NULL,status TEXT NOT NULL,owner TEXT NOT NULL,risk TEXT NOT NULL,due_date DATE NOT NULL,amount NUMERIC(16,2) NOT NULL DEFAULT 0,
  "data_caseReference" TEXT NOT NULL,
  "data_entity" TEXT NOT NULL,
  "data_reviewDate" DATE NOT NULL,
  "data_metric" NUMERIC(16,2) NOT NULL,
  "data_evidenceNotes" TEXT NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_op_exposure_due ON "op_exposure"(due_date);

CREATE TABLE IF NOT EXISTS "op_effects"(
  id BIGSERIAL PRIMARY KEY,reference TEXT UNIQUE NOT NULL,status TEXT NOT NULL,owner TEXT NOT NULL,risk TEXT NOT NULL,due_date DATE NOT NULL,amount NUMERIC(16,2) NOT NULL DEFAULT 0,
  "data_caseReference" TEXT NOT NULL,
  "data_entity" TEXT NOT NULL,
  "data_reviewDate" DATE NOT NULL,
  "data_metric" NUMERIC(16,2) NOT NULL,
  "data_evidenceNotes" TEXT NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_op_effects_due ON "op_effects"(due_date);

CREATE TABLE IF NOT EXISTS "op_submission"(
  id BIGSERIAL PRIMARY KEY,reference TEXT UNIQUE NOT NULL,status TEXT NOT NULL,owner TEXT NOT NULL,risk TEXT NOT NULL,due_date DATE NOT NULL,amount NUMERIC(16,2) NOT NULL DEFAULT 0,
  "data_caseReference" TEXT NOT NULL,
  "data_entity" TEXT NOT NULL,
  "data_reviewDate" DATE NOT NULL,
  "data_metric" NUMERIC(16,2) NOT NULL,
  "data_evidenceNotes" TEXT NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_op_submission_due ON "op_submission"(due_date);

CREATE TABLE IF NOT EXISTS "op_substance_master"(
  id BIGSERIAL PRIMARY KEY,reference TEXT UNIQUE NOT NULL,status TEXT NOT NULL,owner TEXT NOT NULL,risk TEXT NOT NULL,due_date DATE NOT NULL,amount NUMERIC(16,2) NOT NULL DEFAULT 0,
  "data_recordId" TEXT NOT NULL,
  "data_name" TEXT NOT NULL,
  "data_status" TEXT NOT NULL,
  "data_effectiveDate" DATE NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_op_substance_master_due ON "op_substance_master"(due_date);

CREATE TABLE IF NOT EXISTS "op_site_master"(
  id BIGSERIAL PRIMARY KEY,reference TEXT UNIQUE NOT NULL,status TEXT NOT NULL,owner TEXT NOT NULL,risk TEXT NOT NULL,due_date DATE NOT NULL,amount NUMERIC(16,2) NOT NULL DEFAULT 0,
  "data_recordId" TEXT NOT NULL,
  "data_name" TEXT NOT NULL,
  "data_status" TEXT NOT NULL,
  "data_effectiveDate" DATE NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_op_site_master_due ON "op_site_master"(due_date);

CREATE TABLE IF NOT EXISTS "op_supplier_master"(
  id BIGSERIAL PRIMARY KEY,reference TEXT UNIQUE NOT NULL,status TEXT NOT NULL,owner TEXT NOT NULL,risk TEXT NOT NULL,due_date DATE NOT NULL,amount NUMERIC(16,2) NOT NULL DEFAULT 0,
  "data_recordId" TEXT NOT NULL,
  "data_name" TEXT NOT NULL,
  "data_status" TEXT NOT NULL,
  "data_effectiveDate" DATE NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_op_supplier_master_due ON "op_supplier_master"(due_date);

CREATE TABLE IF NOT EXISTS "op_rule_master"(
  id BIGSERIAL PRIMARY KEY,reference TEXT UNIQUE NOT NULL,status TEXT NOT NULL,owner TEXT NOT NULL,risk TEXT NOT NULL,due_date DATE NOT NULL,amount NUMERIC(16,2) NOT NULL DEFAULT 0,
  "data_recordId" TEXT NOT NULL,
  "data_name" TEXT NOT NULL,
  "data_status" TEXT NOT NULL,
  "data_effectiveDate" DATE NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_op_rule_master_due ON "op_rule_master"(due_date);
