SELECT * 
FROM pet_db.friends, pet_db.pets
WHERE friends._friend_id = pets.owner_id;

SELECT * FROM pet_db.friends
INNER JOIN pet_db.pets ON friends.friend_id = pets.owner_id;

-- Queries com mesmo resultado


