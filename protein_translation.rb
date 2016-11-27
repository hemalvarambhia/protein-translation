class Translation
  def self.of_codon sequence
    { 
      'UUU' => 'Phenylalanine', 'UUC' => 'Phenylalanine',
      'AUG' => 'Methionine', 'UUA' => 'Leucine', 'UUG' => 'Leucine',
      'UCU' => 'Serine', 'UCC' => 'Serine', 'UCA' => 'Serine', 
      'UCG' => 'Serine',
      'UAU' => 'Tyrosine', 'UAC' => 'Tyrosine',
      'UGG' => 'Tryptophan'
    }[sequence]
  end
end
