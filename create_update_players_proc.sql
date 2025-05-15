DELIMITER $$

CREATE PROCEDURE UpdatePlayersTable()
BEGIN
    -- Проверка и добавление столбца email
    IF NOT EXISTS (
        SELECT 1
        FROM INFORMATION_SCHEMA.COLUMNS
        WHERE TABLE_SCHEMA = 'rgtournament'
          AND TABLE_NAME = 'players'
          AND COLUMN_NAME = 'email'
    ) THEN
        ALTER TABLE rgtournament.players
        ADD COLUMN email VARCHAR(255) NOT NULL UNIQUE;
    END IF;

    -- Проверка и добавление столбца avatar
    IF NOT EXISTS (
        SELECT 1
        FROM INFORMATION_SCHEMA.COLUMNS
        WHERE TABLE_SCHEMA = 'rgtournament'
          AND TABLE_NAME = 'players'
          AND COLUMN_NAME = 'avatar'
    ) THEN
        ALTER TABLE rgtournament.players
        ADD COLUMN avatar VARCHAR(255) DEFAULT NULL;
    END IF;

    -- Проверка и добавление столбца created_at
    IF NOT EXISTS (
        SELECT 1
        FROM INFORMATION_SCHEMA.COLUMNS
        WHERE TABLE_SCHEMA = 'rgtournament'
          AND TABLE_NAME = 'players'
          AND COLUMN_NAME = 'created_at'
    ) THEN
        ALTER TABLE rgtournament.players
        ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
    END IF;

    -- Проверка и добавление столбца updated_at
    IF NOT EXISTS (
        SELECT 1
        FROM INFORMATION_SCHEMA.COLUMNS
        WHERE TABLE_SCHEMA = 'rgtournament'
          AND TABLE_NAME = 'players'
          AND COLUMN_NAME = 'updated_at'
    ) THEN
        ALTER TABLE rgtournament.players
        ADD COLUMN updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
    END IF;
END$$

DELIMITER ;

-- Вызов процедуры
CALL UpdatePlayersTable();

-- Удаление процедуры после выполнения
DROP PROCEDURE IF EXISTS UpdatePlayersTable;
