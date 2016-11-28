class Translation
  def self.of_codon sequence
    { 
      'UUU' => 'Phenylalanine', 'UUC' => 'Phenylalanine',
      'AUG' => 'Methionine', 'UUA' => 'Leucine', 'UUG' => 'Leucine',
      'UGU' => 'Cysteine', 'UGC' => 'Cysteine',
      'UCU' => 'Serine', 'UCC' => 'Serine', 'UCA' => 'Serine', 
      'UCG' => 'Serine',
      'UAU' => 'Tyrosine', 'UAC' => 'Tyrosine',
      'UGG' => 'Tryptophan',
      'UAA' => 'STOP', 'UAG' => 'STOP', 'UGA' => 'STOP'
    }[sequence]
  end

  def self.of_rna strand
    translations = strand.scan(/[A-Z]{3}/).map { |part| of_codon(part) }

    stop_at = (translations.index('STOP') || translations.size) - 1

    translations[0..stop_at]
  end
end
