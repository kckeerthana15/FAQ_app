class SimilarityMatrix
  
  def self.get_stored_corpus
    corpus = Corpus.new
    col_data = CsvDatabaseOperations.import_from_db
    col_data.each do |data| 
      document = Document.new(:content => data)
      corpus << document
    end
    corpus
  end

  def self.add_to_corpus(questions)
    corpus = self.get_stored_corpus
    @@ori_size = corpus.documents.size
    questions.each do |data|
     indoc = Document.new(:content => data)
    corpus << indoc
    end
    corpus
  end

  def self.get_similarity_matrix(questions)
    corpus = self.add_to_corpus(questions)
    corpus.similarity_matrix
  end

  def self.get_document_obj_from_corpus(questions)
    self.add_to_corpus(questions).documents
  end

  def self.get_ori_doc_size
    return @@ori_size
  end
end