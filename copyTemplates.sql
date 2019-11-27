/** MAKE BACKUPS BEFORE USING!!! */

DROP TABLE IF EXISTS temp.toUpdate;
CREATE TEMPORARY TABLE toUpdate as
SELECT sourceCards.id as sid, destCards.id as did, destCards.nid, sourceCards.type as type, queue, due, ivl, factor, reps, lapses, sourceCards.left, mid
    FROM 
        (SELECT id, nid, ord, cards.type, queue, due, ivl, factor, reps, lapses, cards.left  
        from cards
        /* Copy from the first card for each note. This shouldn't need to be changed but if you want to copy from a different card change this */
        where ord = 0) as sourceCards
    JOIN 
        (SELECT id, nid, ord
        FROM cards
        /* Put the card you want to change here */
        WHERE ord = #######################) as destCards
    ON sourceCards.nid = destCards.nid
    JOIN
    notes
    ON sourceCards.nid = notes.id
/* Use findMID to find the MID and change this*/
WHERE notes.mid = #######################;

UPDATE 
    cards
SET
    type = (SELECT type from temp.toUpdate WHERE cards.id = temp.toUpdate.did),
    queue = (SELECT queue from temp.toUpdate WHERE cards.id = temp.toUpdate.did),
    ivl = (SELECT ivl from temp.toUpdate WHERE cards.id = temp.toUpdate.did),
    factor = (SELECT factor from temp.toUpdate WHERE cards.id = temp.toUpdate.did),
    reps = (SELECT reps from temp.toUpdate WHERE cards.id = temp.toUpdate.did),
    lapses = (SELECT lapses from temp.toUpdate WHERE cards.id = temp.toUpdate.did),
    left = (SELECT left from temp.toUpdate WHERE cards.id = temp.toUpdate.did),
    usn = 0
WHERE
    EXISTS (
        SELECT *
        FROM temp.toUpdate
        WHERE cards.id = temp.toUpdate.did
    );
