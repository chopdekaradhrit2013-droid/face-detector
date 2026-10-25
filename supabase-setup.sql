-- Run this in Supabase SQL Editor
-- Creates table for face descriptors (synced across devices)

create table if not exists public.face_lock (
  id uuid primary key default gen_random_uuid(),
  owner_key text unique not null,
  descriptors jsonb not null,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

-- Enable RLS
alter table public.face_lock enable row level security;

-- Allow anyone to read/write their own row by owner_key (demo only — not bank-grade)
create policy "allow all by owner_key" on public.face_lock
  for all
  using (true)
  with check (true);

-- Optional: auto-update updated_at
create or replace function public.set_updated_at()
returns trigger as $$
begin
  new.updated_at = now();
  return new;
end;
$$ language plpgsql;

create trigger set_updated_at
before update on public.face_lock
for each row execute function public.set_updated_at();