-- SQL: Table to store ongoing weapon crafting tasks

CREATE TABLE IF NOT EXISTS guncrafting_queue (
    id INT AUTO_INCREMENT PRIMARY KEY,
    license VARCHAR(64) NOT NULL,
    weapon_id VARCHAR(64) NOT NULL,
    started_at INT NOT NULL,
    end_at INT NOT NULL,
    completed BOOLEAN DEFAULT FALSE
);