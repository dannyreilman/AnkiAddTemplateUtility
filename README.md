AnkiTemplateAddingUtility

This utility can be used to copy the scheduling data from one card template to another.
This is useful if you have existing notes and you want to add a new template without starting from new with all the existing notes.

TO USE:
1. BACKUP YOUR DECKS. This utility has a very high chance of corrupting a lot of data if you don't set it up properly or if something goes wrong.
2. Export the deck you wish to edit as a apkg file. Extract this file to access the database.
3. Run findMID on the contained database. This will show you some cards from the deck. The last column in this output will be the MID for each of these cards. Find a card that is part of the note you want to run the utility over and look in the last column to get the MID.
4. Edit the copyTemplates utility where commented. You will need the MID and the 0 up index for the template you want to overwrite. 
5. Run copyTemplates and re-zip the database to be reimported.