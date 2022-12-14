package learning.mvc_jsp.service;

import learning.mvc_jsp.db.Microprocessor;
import learning.mvc_jsp.db.MicroprocessorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class MicroprocessorService {
    @Autowired
    private MicroprocessorRepository repository;

    public List<Microprocessor> listAll() {
        return (List<Microprocessor>) repository.findAll();
    }
    public void saveMicroprocessor(Microprocessor microprocessor) {
        repository.save(microprocessor);
    }

    public Microprocessor findMicroprocessor(Integer id) {
        return repository.findById(id).orElseThrow(IllegalArgumentException::new);
    }

    public void deleteMicroprocessorById(Integer id) {
        // 1. найти микропроцессор для удаления
        Optional<Microprocessor> deleted = repository.findById(id);
        // 2. если такой микропроцессор есть, то удалить его
        deleted.ifPresent(microprocessor -> repository.delete(microprocessor));
    }
}
