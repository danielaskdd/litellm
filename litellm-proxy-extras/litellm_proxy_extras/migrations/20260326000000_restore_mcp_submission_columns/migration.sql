-- Restore MCP submission columns that were incorrectly dropped by a bad schema sync.
ALTER TABLE "LiteLLM_MCPServerTable"
  ADD COLUMN IF NOT EXISTS "approval_status" TEXT DEFAULT 'active',
  ADD COLUMN IF NOT EXISTS "submitted_by" TEXT,
  ADD COLUMN IF NOT EXISTS "submitted_at" TIMESTAMP(3),
  ADD COLUMN IF NOT EXISTS "reviewed_at" TIMESTAMP(3),
  ADD COLUMN IF NOT EXISTS "review_notes" TEXT,
  ADD COLUMN IF NOT EXISTS "source_url" TEXT;

ALTER TABLE "LiteLLM_MCPServerTable"
  ALTER COLUMN "approval_status" SET DEFAULT 'active';

CREATE INDEX IF NOT EXISTS "LiteLLM_MCPServerTable_approval_status_idx"
  ON "LiteLLM_MCPServerTable"("approval_status");
