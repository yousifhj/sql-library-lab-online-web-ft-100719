def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT title, year
   FROM Books
   WHERE Series_id = 1
   ORDER BY year;"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT name, motto
  FROM Characters
  ORDER BY LENGTH(motto) DESC
  LIMIT 1;"
end


def select_value_and_count_of_most_prolific_species
  "SELECT species, COUNT(species)
   FROM characters
  GROUP BY species
  ORDER BY COUNT(species) DESC
  LIMIT 1;"
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name
  FROM Series
  INNER JOIN Authors
  ON series.author_id = authors.id
  INNER JOIN subgenres
  ON series.subgenre_id = subgenres.id;"
end

def select_series_title_with_most_human_characters
  "SELECT series.title 
  FROM series 
  JOIN books 
  ON books.series_id = series.id 
  JOIN character_books 
  ON character_books.book_id = books.id 
  JOIN characters 
  ON character_books.character_id = characters.id 
  WHERE characters.species = 'human' 
  GROUP BY series.title 
  ORDER BY COUNT(*) DESC 
  LIMIT 1;"
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name, COUNT(*) as book_count
  FROM character_books
  JOIN characters 
  ON character_books.character_id = characters.id
  GROUP BY characters.name
  ORDER BY book_count DESC, characters.name ASC; "
end
