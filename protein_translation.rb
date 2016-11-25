class Translation
  def self.of_codon sequence
    { 
      'UUU' => 'Phenylalanine', 'UUC' => 'Phenylalanine',
      'AUG' => 'Methionine', 'UUA' => 'Leucine', 'UUG' => 'Leucine'
    }[sequence]
  end
end