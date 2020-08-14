--------------------------------------------------------------------------------
-- Up
--------------------------------------------------------------------------------
CREATE TABLE COMIC (
  comic_id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL,
  title_original TEXT NOT NULL,
  rate INTEGER NOT NULL,
  cover_hash TEXT NOT NULL,
  workspace_id INTEGER NOT NULL,
  reading_progress INTEGER NOT NULL,
  file_count INTEGER NOT NULL,
  file_size INTEGER NOT NULL,
  created_at INTEGER NOT NULL,
  modified_at INTEGER NOT NULL
);

CREATE TABLE WORKSPACE (
  workspace_id INTEGER PRIMARY KEY AUTOINCREMENT,
  workspace_name TEXT NOT NULL,
  workspace_path TEXT NOT NULL,
  created_at INTEGER NOT NULL,
  modified_at INTEGER NOT NULL
);

CREATE TABLE TAG (
  tag_id INTEGER PRIMARY KEY,
  tag_name TEXT NOT NULL,
  intro TEXT,
  parent_id INTEGER NOT NULL,
  tag_namespace TEXT NOT NULL,
  created_at INTEGER NOT NULL,
  modified_at INTEGER NOT NULL
);

CREATE UNIQUE INDEX TAG_UNIQUE on TAG (tag_name, tag_namespace);

CREATE TABLE COMIC_TAG (
  comic_tag_id INTEGER PRIMARY KEY,
  tag_id INTEGER NOT NULL,
  comic_id INTEGER NOT NULL,
  created_at INTEGER NOT NULL
);

CREATE INDEX COMIC_TAG_TAG_ID_INDEX on COMIC_TAG(tag_id);

CREATE UNIQUE INDEX COMIC_TAG_UNIQUE on COMIC_TAG (tag_id, comic_id);

CREATE TABLE SMART_FOLDER (
  smart_folder_id INTEGER PRIMARY KEY,
  smart_folder_name TEXT NOT NULL,
  condition TEXT NOT NULL,
  rules TEXT NOT NULL,
  created_at INTEGER NOT NULL,
  modified_at INTEGER NOT NULL
);

CREATE TABLE NORMAL_FOLDER (
  normal_folder_id INTEGER PRIMARY KEY,
  normal_folder_name TEXT NOT NULL,
  comicIds TEXT NOT NULL,
  created_at INTEGER NOT NULL,
  modified_at INTEGER NOT NULL
);

CREATE TABLE CONFIG (
  config_id INTEGER PRIMARY KEY,
  config_name TEXT NOT NULL,
  config_content TEXT NOT NULL,
  created_at INTEGER NOT NULL,
  modified_at INTEGER NOT NULL
);

CREATE UNIQUE INDEX CONFIG_NAME_UNIQUE on CONFIG (config_name);

--------------------------------------------------------------------------------
-- Down
--------------------------------------------------------------------------------
DROP TABLE COMIC;

DROP TABLE WORKSPACE;

DROP TABLE TAG;

DROP TABLE COMIC_TAG;

DROP INDEX IF EXISTS COMIC_TAG_TAG_ID_INDEX;